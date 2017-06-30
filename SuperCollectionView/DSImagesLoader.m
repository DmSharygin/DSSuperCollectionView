//
//  DSImagesLoader.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 28.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "DSImagesLoader.h"
#import <UIImage+AFNetworking.h>
#import <AFImageDownloader.h>

NSString* const DSImagesLoaderImagesLoadedNotification = @"DSImagesLoaderImagesLoadedNotification";

NSString* const DSImagesLoaderImagesInfoKey = @"DSImagesLoaderImagesInfoKey";

@implementation DSImagesLoader

- (instancetype) initWithImageURLStrings:(NSArray*) imageURLStrings {
    
    self = [super init];
    
    if (self) {
        self.imageURLStrings = imageURLStrings;
        self.images = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype) initWithRandomImageURLStringsOfCount:(int)count {
    self = [super init];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    if (self) {
        
        self.images = [NSMutableArray array];
        for (int i = 0; i < count - 1; i++) {
            
            NSString *randomString = [self randomURLString];
            [tempArray addObject:randomString];
            
        };
    }
    self.imageURLStrings = [NSArray arrayWithArray:tempArray];
    
    return self;
}

#pragma mark - methods

- (void) load:(int)count imagesWithOffset:(int)offset {
    
    if (offset >= self.imageURLStrings.count) {
        NSLog(@"Too big offset");
    } else {
        
        //DSBlocksManager *blockManager = [DSBlocksManager sharedManager];
        NSUInteger imagesNumber = self.images.count;
        int newCount = (count + offset > self.imageURLStrings.count) ?
        (int)self.imageURLStrings.count - offset : count;
        for (int i = offset; i < offset + newCount; i++) {
            NSString *URLString = [self.imageURLStrings objectAtIndex:i];
            NSURLRequest *URLRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
            [[AFImageDownloader defaultInstance] downloadImageForURLRequest:URLRequest success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
                
                [self.images addObject:responseObject];
                NSLog(@"Image %@ downloaded", URLString);
                
                if (self.images.count == imagesNumber + newCount) {
                    
                    NSLog(@"All images loaded");
                    NSRange range;
                    range.location = offset;
                    range.length = newCount;
                    NSArray *imagesArray = [self.images subarrayWithRange:range];
                    
                    NSDictionary *infoDictionary = [NSDictionary dictionaryWithObject:imagesArray
                                                                               forKey:DSImagesLoaderImagesInfoKey];
                    [[NSNotificationCenter defaultCenter] postNotificationName:DSImagesLoaderImagesLoadedNotification object:nil userInfo:infoDictionary];
                    
                }
                
            } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                
                NSLog(@"image %@ is not downloaded \nError: %@", URLString, error);
                
            }];
        }
    }
    
}

- (NSString *) randomURLString {
    
    int randomWidth = 300 + (arc4random_uniform(3) + arc4random_uniform(7))* 100;
    int randomHeight = 300 + (arc4random_uniform(3) + arc4random_uniform(7)) * 100;
    
    NSString *result = [NSString stringWithFormat:@"https://lorempixel.com/%ld/%ld/", (long)randomWidth, (long)randomHeight];
    
    return result;
}



@end
