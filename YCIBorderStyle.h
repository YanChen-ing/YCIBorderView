//
//  YCIBorderStyle.h
//  YCIBorderView
//
//  Created by yanchen on 2019/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 抽象类：边框样式
 */
@interface YCIBorderStyle : NSObject<NSCopying>

@property (nonatomic) CGFloat width;
@property (nonatomic, strong) UIColor *color;

@property (nonatomic) UIEdgeInsets layoutMargins;

/**
 子类具体实现

 @param layer 绘图层
 @param ctx 上下文
 */
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
             from:(CGPoint)fromPoint to:(CGPoint)toPoint;


@end

NS_ASSUME_NONNULL_END
