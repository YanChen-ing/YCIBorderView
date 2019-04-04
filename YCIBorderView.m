//
//  YCIBorderView.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/14.
//

#import "YCIBorderView.h"

@implementation YCIBorderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefaultConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultConfig];
    }
    return self;
}

- (void)setupDefaultConfig{
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = false;
}

- (void)drawRect:(CGRect)rect {
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect contentRect = UIEdgeInsetsInsetRect(rect, self.layoutMargins);
    
    YCIBorderStyle *style;
    UIEdgeInsets insets;

    CGPoint fromPoint, toPoint;
    
    // 上边框
    if (YCIBorderPositionTop & _borderPositions) {
        
        style = _topBorderStyle ?: self.style;
        insets = style.layoutMargins;
        
        fromPoint = CGPointMake(contentRect.origin.x +insets.left,
                                contentRect.origin.y +insets.top +style.width/2.f);
        
        toPoint = CGPointMake(CGRectGetMaxX(contentRect) -insets.right,
                              contentRect.origin.y +insets.top +style.width/2.f);
        
        [style drawLayer:self.layer inContext:ctx from:fromPoint to:toPoint];
        
    }
    
    // 下边框
    if (YCIBorderPositionBottom & _borderPositions) {
        
        style = _bottomBorderStyle ?: self.style;
        insets = style.layoutMargins;
        
        fromPoint = CGPointMake(contentRect.origin.x +insets.left,
                                CGRectGetMaxY(contentRect) -insets.bottom -style.width/2.f);
        
        toPoint = CGPointMake(CGRectGetMaxX(contentRect) -insets.right,
                              CGRectGetMaxY(contentRect) -insets.bottom -style.width/2.f);
        
        [style drawLayer:self.layer inContext:ctx from:fromPoint to:toPoint];
        
    }
    
    // 左边框
    if (YCIBorderPositionLeft & _borderPositions) {
        
        style = _leftBorderStyle ?: self.style;
        insets = style.layoutMargins;
        
        fromPoint = CGPointMake(contentRect.origin.x +insets.left +style.width/2.f,
                                contentRect.origin.y +insets.top);
        
        toPoint = CGPointMake(contentRect.origin.x +insets.left +style.width/2.f,
                              CGRectGetMaxY(contentRect) -insets.bottom);
        
        [style drawLayer:self.layer inContext:ctx from:fromPoint to:toPoint];
    }
    
    // 右边框
    if (YCIBorderPositionRight & _borderPositions) {
        
        style = _rightBorderStyle ?: self.style;
        insets = style.layoutMargins;
        
        fromPoint = CGPointMake(CGRectGetMaxX(contentRect) -insets.right -style.width/2.f,
                                contentRect.origin.y +insets.top);
        
        toPoint = CGPointMake(CGRectGetMaxX(contentRect) -insets.right -style.width/2.f,
                              CGRectGetMaxY(contentRect) -insets.bottom);
        
        [style drawLayer:self.layer inContext:ctx from:fromPoint to:toPoint];
        
    }
    
}

#pragma mark - ------- 标记显示刷新

- (void)refresh {
    [self setNeedsDisplay];
}

- (void)setBorderPositions:(YCIBorderPosition)borderPositions {
    
    if (_borderPositions == borderPositions) {
        return;
    }
    
    _borderPositions = borderPositions;
    [self setNeedsDisplay];
}

@end
