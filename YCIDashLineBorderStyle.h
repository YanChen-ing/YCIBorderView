//
//  YCIDashLineBorderStyle.h
//  YCIBorderView
//
//  Created by yanchen on 2019/3/18.
//

#import "YCIBorderStyle.h"

NS_ASSUME_NONNULL_BEGIN
/**
 短划线边框样式
 */
@interface YCIDashLineBorderStyle : YCIBorderStyle

/**
 第一个虚线绘制时跳过 `phase` 个点
 */
@property (nonatomic) CGFloat phase;

/**
 按照 {虚线, 实线, 虚线 ...} 顺序设置各线 点数
 因为使用 C数组，故需要将数组值声明为 static 如：
 
 static CGFloat dashArray[] = {10, 5};
 self.lengths = dashArray;
 
 */
@property (nonatomic) CGFloat *lengths;


/**
 `lengths` 的 长度
 */
@property (nonatomic) size_t  lengthsCount;


@end

NS_ASSUME_NONNULL_END
