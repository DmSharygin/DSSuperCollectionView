//
//  ViewController.m
//  SuperCollectionView
//
//  Created by Dmitry Sharygin on 25.06.17.
//  Copyright © 2017 Dmitry Sharygin. All rights reserved.
//

#import "ViewController.h"
#import "DSSuperCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect collectionViewFrame = CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2);
    
    DSSuperCollectionView *collectionView = [[DSSuperCollectionView alloc]initWith:8 randomImageURLStringsAndFrame:collectionViewFrame];
    collectionView.layoutManager.chosenBlockTypes = DSLayoutManagerUsedBlockTwoPortrait | DSLayoutManagerUsedBlockTwoSquare;
    
    [self.view addSubview:collectionView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
