//
//  DSBlockCellInfo.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    DSBlockCellInfoViewOrientationNone,
    DSBlockCellInfoViewOrientationPortrait,
    DSBlockCellInfoViewOrientationAlbum,
    DSBlockCellInfoViewOrientationSquare,
    DSBlockCellInfoViewOrientationPanoram
    
} DSBlockCellInfoViewOrientation;

@interface DSBlockCellInfo : NSObject

@property (assign, nonatomic) CGRect frame;
@property (strong, nonatomic) UIView *view;
@property (assign, nonatomic) DSBlockCellInfoViewOrientation viewOrientation;

- (instancetype) initWithOrientation:(DSBlockCellInfoViewOrientation)orientation;
- (instancetype) initWithView:(UIView *) view;

@end
