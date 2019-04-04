//
//  YCIDashLineBorderStyle.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/18.
//

#import "YCIDashLineBorderStyle.h"

@implementation YCIDashLineBorderStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _phase = 0.f;
        
        static CGFloat dashArray[] = {12, 8};
        _lengths = dashArray;

        _lengthsCount = 2;
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx from:(CGPoint)fromPoint to:(CGPoint)toPoint{
    
    // 绘虚线
    // 线条宽
    CGContextSetLineWidth(ctx, self.width);
    // 线条颜色
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    // 虚线
    CGContextSetLineDash(ctx, self.phase, self.lengths, self.lengthsCount);
    // 起点
    CGContextMoveToPoint(ctx, fromPoint.x, fromPoint.y);
    // 终点
    CGContextAddLineToPoint(ctx, toPoint.x, toPoint.y);
    // 绘制路径
    CGContextStrokePath(ctx);
    
}

#pragma mark - ------- NSCopying

- (id)copyWithZone:(NSZone *)zone{
    
    YCIDashLineBorderStyle *s = [super copyWithZone:zone];
    
    if (s) {
        s.phase = self.phase;
        s.lengths = self.lengths;
        s.lengthsCount = self.lengthsCount;
    }
    
    return s;
}

@end
