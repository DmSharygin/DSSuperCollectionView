//
//  DSBlock.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "DSBlock.h"
#import "DSBlockCellInfo.h"

CGFloat blockHeight;

@interface DSBlock ()

@end

@implementation DSBlock

- (instancetype) initWithConfiguration:(DSBlockConfiguration)configuration andWidth:(CGFloat)width {
    
    self = [super init];
    if (self) {
        
        self.configuration = configuration;
        [self setupCellsForConfiguration:configuration];
        self.width = width;
        
    }
    
    return self;
}

- (instancetype) initCustomBlockWithCellsCount:(int)count andSize:(CGSize)size {
    
    self = [super init];
    if (self) {
        self.cellsCount = count;
        self.width = size.width;
        self.height = size.height;
    }
    
    return self;
}

#pragma mark - Methods

- (void) setupCellsForConfiguration:(DSBlockConfiguration) configuration {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    CGFloat heightKoef = 1.f;
    
    switch (configuration) {
        case DSBlockConfigurationTwoSquare: {
         
            DSBlockCellInfo *cell1 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationSquare];
            DSBlockCellInfo *cell2 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationSquare];
            [tempArray addObjectsFromArray:@[cell1, cell2]];
            self.cellsInfoArray = tempArray;
            heightKoef = 0.5f;

        }
            break;
            
        case DSBlockConfigurationTwoPortrait: {
            
            DSBlockCellInfo *cell1 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationPortrait];
            DSBlockCellInfo *cell2 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationPortrait];
            [tempArray addObjectsFromArray:@[cell1, cell2]];
            self.cellsInfoArray = tempArray;
            heightKoef = 3.f / 8.f;

        }
            break;
            
        case DSBlockConfigurationThreeDifferentAlbum: {
            
            DSBlockCellInfo *cell1 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationAlbum];
            DSBlockCellInfo *cell2 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationAlbum];
            DSBlockCellInfo *cell3 = [[DSBlockCellInfo alloc] initWithOrientation:DSBlockCellInfoViewOrientationAlbum];
            
            [tempArray addObjectsFromArray:@[cell1, cell2, cell3]];
            self.cellsInfoArray = tempArray;
            heightKoef = 0.5f;
            
        }
            break;
            
        default:
            heightKoef = 1.f;
            
            break;
    }
    self.height = self.width * heightKoef;
}

@end
