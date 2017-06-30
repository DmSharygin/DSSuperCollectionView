//
//  DSLayoutManager.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 26.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSUInteger, DSChosenBlockTypes) {
    
    DSLayoutManagerUsedBlockTwoPortrait             = 1 << 0,
    DSLayoutManagerUsedBlockThreeDifferentAlbum     = 1 << 1,
    DSLayoutManagerUsedBlockTwoSquare               = 1 << 2
    
};

typedef struct BlocksPriority {
    
    int DSLayoutManagerBlocksPriorityTwoPortrait;
    int DSLayoutManagerBlocksPriorityThreeDifferentAlbum;
    int DSLayoutManagerBlocksPriorityTwoSquare;
    
} DSLayoutManagerBlocksPriority;

@interface DSLayoutManager : NSObject

@property (assign, nonatomic) DSChosenBlockTypes chosenBlockTypes;
@property (assign, nonatomic) DSLayoutManagerBlocksPriority blocksPriority;

- (UIView *) viewForIndexPath:(NSIndexPath *) indexPath;
- (CGRect) frameForIndexPath:(NSIndexPath *) indexPath;
- (UIOffset) offsetForIndexPath:(NSIndexPath *) indexPath;

- (void) updateLayoutWithNewViews:(NSArray *) views;

+ (DSLayoutManager *) sharedManger;

@end
