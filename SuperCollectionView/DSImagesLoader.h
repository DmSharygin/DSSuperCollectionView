//
//  DSImagesLoader.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 28.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const DSImagesLoaderImagesLoadedNotification;

extern NSString* const DSImagesLoaderImagesInfoKey;

@interface DSImagesLoader : NSObject

@property (strong, atomic) NSArray *imageURLStrings;
@property (strong, atomic) NSMutableArray *images;

- (instancetype) initWithImageURLStrings:(NSArray*)imageURLStrings;
- (instancetype) initWithRandomImageURLStringsOfCount:(int)count;

- (void) load:(int) count imagesWithOffset:(int) offset;

@end
