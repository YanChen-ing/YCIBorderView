//
//  YCILineBorderStyle.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/15.
//

#import "YCILineBorderStyle.h"

@implementation YCILineBorderStyle

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx from:(CGPoint)fromPoint to:(CGPoint)toPoint{
    
    // 绘实线
    // 线条宽
    CGContextSetLineWidth(ctx, self.width);
    // 线条颜色
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    
    // 起点坐标
    CGContextMoveToPoint(ctx, fromPoint.x, fromPoint.y);
    // 终点坐标
    CGContextAddLineToPoint(ctx, toPoint.x, toPoint.y);
    // 绘制路径
    CGContextStrokePath(ctx);
    
}

@end
