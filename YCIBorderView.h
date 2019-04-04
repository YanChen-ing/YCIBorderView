//
//  YCIBorderView.h
//  YCIBorderView
//
//  Created by yanchen on 2019/3/14.
//

#import <UIKit/UIKit.h>

#import "YCIBorderStyle.h"
#import "YCILineBorderStyle.h"
#import "YCIDashLineBorderStyle.h"
//#import "YCIImageBorderStyle.h"


/**
 边框位置
 
 - YCIBorderPositionNone: 无边框
 - YCIBorderPositionTop: 上边框
 - YCIBorderPositionBottom: 下边框
 - YCIBorderPositionLeft: 左边框
 - YCIBorderPositionRight: 右边框
 - YCIBorderPositionAll: 全边框：上下左右
 */
typedef NS_ENUM(NSUInteger, YCIBorderPosition) {
    YCIBorderPositionNone             = 0,
    YCIBorderPositionTop              = 1 << 0,
    YCIBorderPositionBottom           = 1 << 1,
    YCIBorderPositionLeft             = 1 << 2,
    YCIBorderPositionRight            = 1 << 3,
    
    YCIBorderPositionAll              = YCIBorderPositionTop | YCIBorderPositionBottom | YCIBorderPositionLeft | YCIBorderPositionRight
};

NS_ASSUME_NONNULL_BEGIN

/**
 边框视图
 展示指定类型的边框风格
 */
@interface YCIBorderView : UIView<UIAppearance>

/**
 需要显示边框的位置。显示后更改，不需要标记刷新。
 默认：YCIBorderPositionNone
 */
@property (nonatomic) YCIBorderPosition borderPositions UI_APPEARANCE_SELECTOR;


/**
 通用样式。若未特殊设定，则使用通用样式。显示后，再更改，需要手动刷新 - (void)refresh。
 默认：nil。若未设定，使用全局外观设定:[YCIBorderStyle appearence]
 */
@property (nonatomic, copy) YCIBorderStyle *style UI_APPEARANCE_SELECTOR;

/**
 可分别设置 上、下、左、右 各边的样式. 显示后，再更改，需要手动刷新 - (void)refresh。
 默认：nil。未设定，则使用 style。
 */
@property (nonatomic, copy) YCIBorderStyle *topBorderStyle UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) YCIBorderStyle *bottomBorderStyle UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) YCIBorderStyle *leftBorderStyle UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) YCIBorderStyle *rightBorderStyle UI_APPEARANCE_SELECTOR;


/**
 style 显示后，再更改，需要手动刷新。
 */
- (void)refresh;

@end


NS_ASSUME_NONNULL_END
