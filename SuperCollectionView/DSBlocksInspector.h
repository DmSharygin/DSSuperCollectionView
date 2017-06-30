//
//  DSBlocksInspector.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 29.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSBlocksInspector : NSObject

@property (strong, nonatomic) NSMutableArray *uncomletedBlocks;
@property (strong, nonatomic) NSMutableArray *completedBlocks;
@property (strong, nonatomic) NSMutableDictionary *blocksCounter;

- (NSArray *) blocksFromInfoCells:(NSArray *) infoCells;


@end
