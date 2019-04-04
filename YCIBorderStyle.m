//
//  YCIBorderStyle.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/15.
//

#import "YCIBorderStyle.h"

@implementation YCIBorderStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _width = 1.0f;
        _color = [UIColor colorWithRed:242/255.0f green:243/255.0f blue:246/255.0f alpha:1.0f];
        _layoutMargins = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx from:(CGPoint)fromPoint to:(CGPoint)toPoint{
    
    NSAssert(0, @"子类需实现");
    
}

#pragma mark - ------- NSCopying

-(id)copyWithZone:(NSZone *)zone{
    
    YCIBorderStyle *style = [[[self class] allocWithZone:zone] init];
    
    style.width   = self.width;
    style.color   = self.color;
    style.layoutMargins = self.layoutMargins;
    
    return style;
}

@end
