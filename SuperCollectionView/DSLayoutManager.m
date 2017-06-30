//
//  DSLayoutManager.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 26.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "DSLayoutManager.h"
#import "DSBlockCellInfo.h"

@interface DSLayoutManager ()

@property (strong, nonatomic) NSMutableArray *unsortedCellInfos;
@property (strong, nonatomic) NSMutableArray *blockCounters;

@end

@implementation DSLayoutManager

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        DSLayoutManagerBlocksPriority defaultPriority;
        defaultPriority.DSLayoutManagerBlocksPriorityThreeDifferentAlbum = 10;
        defaultPriority.DSLayoutManagerBlocksPriorityTwoSquare = 10;
        defaultPriority.DSLayoutManagerBlocksPriorityTwoPortrait = 10;
        self.blocksPriority = defaultPriority;
        
        self.unsortedCellInfos = [NSMutableArray array];
    }
    
    return self;
}

+ (DSLayoutManager *) sharedManger {
    
    static DSLayoutManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DSLayoutManager alloc] init];
    });
    
    return manager;
}

#pragma mark - Methods

- (void) updateLayoutWithNewViews:(NSArray *)views {
    
    for (UIView *view in views) {
        DSBlockCellInfo *newCellInfo = [self cellInfoForView:view];
        [self.unsortedCellInfos addObject:newCellInfo];
    }
    [self sortInfoCells];
    
}

- (DSBlockCellInfo *) cellInfoForView:(UIView *) view {
    
    DSBlockCellInfo *cellInfo = [[DSBlockCellInfo alloc] initWithView:view];
    
    return cellInfo;
}

- (void) sortInfoCells {
    
    
    
}

#pragma mark - Setters

-(void)setUsedBlockTypes:(DSChosenBlockTypes)chosenBlockTypes {
    
    _chosenBlockTypes = chosenBlockTypes;
    
}

@end
