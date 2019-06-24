//
//  JMCollectionViewCell.h
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "JMPopUpModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) JMPopUpModel *model;

@end

NS_ASSUME_NONNULL_END
