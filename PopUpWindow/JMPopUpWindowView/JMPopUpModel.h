//
//  JMPopUpModel.h
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMPopUpModel : NSObject

// 标题
@property (nonatomic, copy) NSString *title;

// 图片
@property (nonatomic, strong) UIImage *iconImage;

@end

NS_ASSUME_NONNULL_END
