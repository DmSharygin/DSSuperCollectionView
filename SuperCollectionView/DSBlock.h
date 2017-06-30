//
//  DSBlock.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    DSBlockConfigurationTwoPortrait,
    DSBlockConfigurationThreeDifferentAlbum,
    DSBlockConfigurationTwoSquare
    
} DSBlockConfiguration;

@interface DSBlock : NSObject

@property (strong, nonatomic) NSArray *cellsInfoArray;
@property (strong, nonatomic) NSArray *vacantCells;
@property (assign, nonatomic) BOOL isComplete;
@property (assign, nonatomic) int cellsCount;
@property (assign, nonatomic) DSBlockConfiguration configuration;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat yOffset;

- (instancetype)initWithConfiguration:(DSBlockConfiguration) configuration andWidth:(CGFloat) width;
- (instancetype)initCustomBlockWithCellsCount:(int)count andSize:(CGSize)size;


@end
