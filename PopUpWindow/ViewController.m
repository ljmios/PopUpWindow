//
//  ViewController.m
//  PopUpWindow
//
//  Created by liujiemin on 2019/6/24.
//  Copyright © 2019 刘杰民. All rights reserved.
//

#import "ViewController.h"
#import "JMPopUpWindowView.h"


@interface ViewController ()<JMPopUpDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *locationBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 100, 200, 80)];
    [locationBtn setTitle:@"分享" forState:UIControlStateNormal];
    [locationBtn setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:locationBtn];
    
    [locationBtn addTarget:self action:@selector(locationBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)locationBtnAction
{
    JMPopUpModel *model1 = [[JMPopUpModel alloc] init];
    model1.title = @"发送给朋友";
    model1.iconImage = [UIImage imageNamed:@"Wechat"];
    
    JMPopUpModel *model2 = [[JMPopUpModel alloc] init];
    model2.title = @"发送给好友";
    model2.iconImage = [UIImage imageNamed:@"QQ"];
    
    NSArray *array = @[model1,model2,model1,model1,model1,model1,model1,model1];
    
    JMPopUpWindowView *popView = [JMPopUpWindowView initItems:array];
    popView.delegate = self;
    [popView show];
}

#pragma mark - JMPopUpDelegate
- (void)didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld个",(long)(index+1));
}


@end
