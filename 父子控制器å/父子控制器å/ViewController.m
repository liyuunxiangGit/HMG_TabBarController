//
//  ViewController.m
//  父子控制器å
//
//  Created by liyunxiang on 17/3/6.
//  Copyright © 2017年 liyunxiang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"


/*
 多控制器:当有很多控制器,交给一个大控制器管理
 父子控制器:导航控制器,UITabBarControler
 父子控制器本质:搞一个控制器容器,管理很多子控制器.
 
 
 .
 
 任何控制器都可以是一个容器控制器.因为任何控制器都可以调用addChildViewController
 
 // UITabBarControler使用步骤
 // 1.显示UITabBarControler
 // 2.添加子控制器
 
 // ViewController
 */

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController
- (IBAction)showVC:(UIButton*)sender {
    //获取之前控制器的View
    UIView *firstView;
    if (self.contentView.subviews.count) {
        firstView = self.contentView.subviews[0];
    }
    
    //显示子控制器
    UIViewController *vc = self.childViewControllers[sender.tag];
    vc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:vc.view];
    
    
    //移除之前控制器的view
    [firstView removeFromSuperview];
}
// 父子控制器:如果A控制器的view添加到B控制器的view,A控制器就要成为B控制器子控制器

// 父子控制器:如果一个控制器的view显示,那么这个控制器必须存在
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1.添加子控制器
    [self setUpAllChildViewController];
    // 2.设置按钮标题
    [self setUpButtonTitle];

}
// 设置按钮标题
- (void)setUpButtonTitle
{
    NSUInteger count = self.titleView.subviews.count;
    for (int i = 0; i<count; i++) {
        UIButton *btn = self.titleView.subviews[i];
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
    }
}
//添加子控制器
- (void)setUpAllChildViewController{
    FirstViewController *first = [[FirstViewController alloc]init];
    first.title = @"第一页";
    [self addChildViewController:first];
    
    
    TwoViewController *two = [[TwoViewController alloc]init];
    two.title = @"第二页";
    [self addChildViewController:two];
    
    ThreeViewController *three = [[ThreeViewController  alloc]init];
    three.title = @"第三页";
    [self addChildViewController:three];
    
    
    FourViewController *four = [[FourViewController alloc]init];
    four.title = @"第四页";
    [self addChildViewController:four];
}



@end
