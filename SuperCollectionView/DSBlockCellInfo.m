//
//  DSBlockCellInfo.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "DSBlockCellInfo.h"

@implementation DSBlockCellInfo

-(instancetype)initWithOrientation:(DSBlockCellInfoViewOrientation)orientation {
    
    self = [super init];
    if (self) {
        self.viewOrientation = orientation;
    }
    
    return self;
}

- (instancetype) initWithView:(UIView *)view {
    
    self = [super init];
    
    if (self) {
        
        self.view = view;
        self.viewOrientation = [self determineOrientation];
        
    }
    
    return self;
}

- (DSBlockCellInfoViewOrientation) determineOrientation {
    
    if (self.view) {
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = self.view.bounds.size.height;
        CGFloat orientationKoef = width / height;
        if (orientationKoef < 0.85) {
            
            NSLog(@"Portrait");
            return DSBlockCellInfoViewOrientationPortrait;
        } else if (orientationKoef > 1.2 && orientationKoef < 3.0) {
            
            NSLog(@"Album");
            return DSBlockCellInfoViewOrientationAlbum;
            
        } else if (orientationKoef >= 3.0) {
            NSLog(@"Panoram");
            return DSBlockCellInfoViewOrientationPanoram;
            
        }
        
        NSLog(@"Square");
        return DSBlockCellInfoViewOrientationSquare;
    }
    
    return DSBlockCellInfoViewOrientationNone;
}

@end
