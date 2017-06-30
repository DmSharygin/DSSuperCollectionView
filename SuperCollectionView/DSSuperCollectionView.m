//
//  DSSuperCollectionView.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "DSSuperCollectionView.h"
#import "DSImagesLoader.h"

@interface DSSuperCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation DSSuperCollectionView

static NSString *identifier = @"cell";

-(instancetype)initWithFrame:(CGRect)frame andURLStrings:(NSArray *)URLStrings {
    
    self = [super initWithFrame:frame];
    if (self) {
        DSImagesLoader *imageLoader = [[DSImagesLoader alloc] initWithImageURLStrings:URLStrings];
        [imageLoader load:5 imagesWithOffset:0];
        self.layoutManager = [DSLayoutManager sharedManger];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleImagesLoaded:)
                                                     name:DSImagesLoaderImagesLoadedNotification
                                                   object:nil];
    }
    
    return self;
}

-(instancetype)initWith:(int)count randomImageURLStringsAndFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        DSImagesLoader *imageLoader = [[DSImagesLoader alloc] initWithRandomImageURLStringsOfCount:count];
        
        self.layoutManager = [DSLayoutManager sharedManger];
        [imageLoader load:5 imagesWithOffset:0];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleImagesLoaded:)
                                                     name:DSImagesLoaderImagesLoadedNotification
                                                   object:nil];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [self setupCollectionView];

}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

#pragma mark - Methods 

-(void) setup {
    
}

-(void) setupCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    self.collectionView.backgroundColor = [UIColor orangeColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self addSubview:self.collectionView];
    
}

#pragma mark - Notifications 

-(void) handleImagesLoaded:(NSNotification*) notification {
    
    NSArray *newImages = [notification.userInfo objectForKey:DSImagesLoaderImagesInfoKey];
    [self.images addObjectsFromArray:newImages];
    
    NSMutableArray *newImageViews = [NSMutableArray array];
    
    for (UIImage *image in newImages) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [newImageViews addObject:imageView];
    }
    
    [[DSLayoutManager sharedManger] updateLayoutWithNewViews:newImageViews];

}

@end
