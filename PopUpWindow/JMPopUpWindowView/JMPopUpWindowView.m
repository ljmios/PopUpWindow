//
//  JMPopUpWindowView.m
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import "JMPopUpWindowView.h"
#import "Masonry.h"
#import "JMCollectionViewCell.h"

#define k_statusbar_height [UIApplication sharedApplication].statusBarFrame.size.height
#define viewHeigth self.collectionView.frame.size.height + self.cancelBtn.frame.size.height

@interface JMPopUpWindowView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *items;

@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JMPopUpWindowView

+ (instancetype) initItems:(NSArray *)items
{
    return [[self alloc] initItems:items];
}

- (void)show
{
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    
    [self creatShowAnimation];
}

- (void)creatShowAnimation
{
    self.collectionView.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height + viewHeigth);
    self.cancelBtn.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height + viewHeigth);
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        self.collectionView.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height - viewHeigth);
        self.cancelBtn.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height - viewHeigth);
    }];
}

- (void)hidden
{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        self.collectionView.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height + viewHeigth);
        self.cancelBtn.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height + viewHeigth);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hidden];
}

- (instancetype) initItems:(NSArray *)items
{
    self = [super init];
    self.frame = [UIScreen mainScreen].bounds;
    if (self) {
        _items = items;
        [self prepareView];
    }
    return self;
}

- (void)prepareView
{
    [self addSubview:self.cancelBtn];
    [self addSubview:self.collectionView];
    
    CGFloat height = 49;
    if (k_statusbar_height > 20) {
        height = 83;
    }
    
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(height));
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.cancelBtn.mas_top).offset(-0.5);
        make.height.equalTo(@120);
    }];
}

# pragma UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJMPopUpCollectionViewCell" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor orangeColor];
    JMPopUpModel *mdoel = self.items[indexPath.item];
    cell.model = mdoel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate) {
        [self.delegate didSelectItemAtIndex:indexPath.row];
        [self hidden];
    }
}

# pragma setter
- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setBackgroundColor:[UIColor whiteColor]];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        
        if(k_statusbar_height > 20)
        {
            [_cancelBtn setTitleEdgeInsets:UIEdgeInsetsMake(-30, 0, 0, 0)];
        }
    }
    return _cancelBtn;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake(70, 100);
        //设置UICollectionView的滑动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
        [_collectionView registerClass:[JMCollectionViewCell class] forCellWithReuseIdentifier:@"LJMPopUpCollectionViewCell"];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate   = self;
        
        _collectionView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
    }
    return _collectionView;
}

@end
