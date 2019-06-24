//
//  JMPopUpWindowView.h
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMPopUpModel.h"

@protocol JMPopUpDelegate <NSObject>

/// 点击的代理方法
/// @param index 返回点击的序列号
- (void)didSelectItemAtIndex:(NSInteger) index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface JMPopUpWindowView : UIView

@property (nonatomic, weak) id <JMPopUpDelegate>delegate;

/**
 初始化
 
 @param items 图标的数组(元素为JMPopUpModel)
 @return self
 */
+ (instancetype) initItems:(NSArray *)items;

// 显示
- (void)show;

// 隐藏
- (void)hidden;

@end

NS_ASSUME_NONNULL_END
