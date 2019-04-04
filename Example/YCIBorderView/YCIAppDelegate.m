//
//  YCIAppDelegate.m
//  YCIBorderView
//
//  Created by YanChen-ing on 04/04/2019.
//  Copyright (c) 2019 YanChen-ing. All rights reserved.
//

#import "YCIAppDelegate.h"
#import "YCIBorderView.h"

@implementation YCIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    YCILineBorderStyle *borderStyle = [[YCILineBorderStyle alloc] init];
    borderStyle.color = [UIColor redColor];
    borderStyle.width = 4.f;
    
    YCIBorderView *borderView = [YCIBorderView appearance];
    
    borderView.layoutMargins = UIEdgeInsetsZero;
    borderView.borderPositions = YCIBorderPositionAll;
    borderView.style = borderStyle;
    //    borderView.backgroundColor = [UIColor clearColor];
    
    return YES;
}

@end
