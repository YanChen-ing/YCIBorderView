//
//  YCIViewController.m
//  YCIBorderView
//
//  Created by YanChen-ing on 04/04/2019.
//  Copyright (c) 2019 YanChen-ing. All rights reserved.
//

#import "YCIViewController.h"

#import "YCIBorderView.h"
#import "UIView+YCIBorderView.h"

@interface YCIViewController ()

@property (weak, nonatomic) IBOutlet YCIBorderView *borderView;

@end

@implementation YCIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.borderView.style = [self lineStyle];
}

- (void)viewDidAppear:(BOOL)animated{
    
    // view 上再添加一个边框
    
    YCIBorderView *bv = self.view.borderView; // 建议通过这种方式创建，防止后续指定不同的view
    
    bv.frame = CGRectInset(self.view.bounds, 15, 70);
    
    bv.style.color = [UIColor brownColor];
    
    bv.backgroundColor = [UIColor lightGrayColor]; // 可作为卡片背景
    
}

- (YCIBorderStyle *)lineStyle{
    
    YCILineBorderStyle *style = [[YCILineBorderStyle alloc] init];
    
    style.width = 1.f;
    //    style.color = [UIColor grayColor];
    
    return style;
}

- (YCIBorderStyle *)dashLineStyle{
    
    YCIDashLineBorderStyle *style = [[YCIDashLineBorderStyle alloc] init];
    
    style.width = 1.f;
    style.color = [UIColor grayColor];
    
    style.phase = 10; // 前空余点数
    
    static CGFloat dashArray[] = {12, 8}; // {实线点数，虚线点数}
    style.lengths = dashArray;
    
    style.lengthsCount = 2;
    
    return style;
}

#pragma mark - ------- Action

- (IBAction)changeBorderPositions:(UISwitch *)sender {
    
    self.borderView.borderPositions ^= sender.tag; //按位异或
    
}

- (IBAction)changeBorderColor:(UISegmentedControl *)sender {
    
    self.borderView.style.color = sender.selectedSegmentIndex ? [UIColor blueColor] : [UIColor redColor];
    
    [self.borderView refresh];  // 标记需要刷新
}


@end
