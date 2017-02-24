//
//  ViewController.m
//  SQSafetyService
//
//  Created by Huang Yanan on 2017/2/8.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *nilStr = nil;
    NSDictionary *dict = @{
                           @"key" :
                               nilStr,
                           @"key2":@"value2"
                           };

    NSArray *array = @[@1,@2,nilStr];
    NSLog(@"count:%@",@(array.count));
    NSLog(@"%@,%@,%@,%@",array[0],array[1],array[2],array[3]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
