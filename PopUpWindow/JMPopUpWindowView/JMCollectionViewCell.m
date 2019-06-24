//
//  JMCollectionViewCell.m
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import "JMCollectionViewCell.h"

/// 颜色(RGB)
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

@interface JMCollectionViewCell()

@property (nonatomic, strong)UIImageView *iconImageView;

@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation JMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 初始化view
        [self prepareView];
    }
    return self;
}

#pragma mark - 初始化view
- (void)prepareView
{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.height.equalTo(@50);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(8);
    }];
}

- (void)setModel:(JMPopUpModel *)model
{
    _model = model;
    self.iconImageView.image = model.iconImage;
    self.titleLabel.text = model.title;
}

#pragma mark - 懒加载
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor whiteColor];
        _iconImageView.layer.cornerRadius = 8.5;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        // 设置字体居中显示
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = RGB(33, 33, 33);
        // 设置字体
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

@end
