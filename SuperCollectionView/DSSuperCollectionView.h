//
//  DSSuperCollectionView.h
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 27.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSLayoutManager.h"

@interface DSSuperCollectionView : UIView

@property (strong, nonatomic) DSLayoutManager *layoutManager;

-(instancetype)initWithFrame:(CGRect)frame andURLStrings:(NSArray *) URLStrings;

-(instancetype)initWith:(int)count randomImageURLStringsAndFrame:(CGRect)frame;

@end
