//
//  YCIImageBorderStyle.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/18.
//

#import "YCIImageBorderStyle.h"

@implementation YCIImageBorderStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx from:(CGPoint)fromPoint to:(CGPoint)toPoint{
    
    // 绘图
    CGContextSaveGState(ctx);
    
    // 图形上下文形变，避免图片倒立显示
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0.0, -150.0);
    // 图片
    UIImage *image = [UIImage imageNamed:self.imageName];
    CGContextDrawImage(ctx, CGRectMake(fromPoint.x, fromPoint.y, toPoint.x -fromPoint.x, toPoint.y -fromPoint.y), image.CGImage);
    
    CGContextRestoreGState(ctx);
    
}

#pragma mark - ------- NSCopying

- (id)copyWithZone:(NSZone *)zone{
    
    YCIImageBorderStyle *s = [super copyWithZone:zone];
    
    if (s) {
//        s.phase = self.phase;
//        s.lengths = self.lengths;
//        s.lengthsCount = self.lengthsCount;
    }
    
    return s;
}

@end
