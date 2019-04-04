//
//  UIView+YCIBorderView.m
//  YCIBorderView
//
//  Created by yanchen on 2019/3/18.
//

#import "UIView+YCIBorderView.h"

#import <objc/runtime.h>

@implementation UIView (YCIBorderView)


#pragma mark - ------- Setter && Getter

- (YCIBorderView *)borderView {
    
    YCIBorderView *v = objc_getAssociatedObject(self, _cmd);
    
    if (!v) {
        v = [[YCIBorderView alloc] initWithFrame:self.bounds];
        v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self insertSubview:v atIndex:0];
        [self setBorderView:v]; // 保存关联
    }
    return v;
}

- (void)setBorderView:(YCIBorderView * _Nonnull)borderView {
    objc_setAssociatedObject(self, @selector(borderView), borderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
