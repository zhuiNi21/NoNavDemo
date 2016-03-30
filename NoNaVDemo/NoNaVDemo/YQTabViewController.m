//
//  YQTabViewController.m
//  YqTong
//
//  Created by new on 16/3/23.
//  Copyright © 2016年 wcw. All rights reserved.
//

#import "YQTabViewController.h"
#import "YQHomeViewController.h"
#import "YQMessageViewController.h"
#import "YQMeViewController.h"
#import "YQNavigationController.h"


@interface YQTabViewController ()

@end

@implementation YQTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAllChildController];
}
-(void)addAllChildController{
    
    YQHomeViewController *home=[[YQHomeViewController alloc]init];
    [self addChildViewController:home WithTitle:@"首页" imageName:@"home2" selectedImageName:@"home1"];
    
    
    YQMessageViewController *findTeacher=[[YQMessageViewController alloc]init];
    [self addChildViewController:findTeacher WithTitle:@"消息" imageName:@"message2" selectedImageName:@"message1"];
    
    //    JDYiKaoViewController *yikao=[[JDYiKaoViewController alloc]init];
    YQMeViewController *yikao=[[YQMeViewController alloc]init];
    [self addChildViewController:yikao WithTitle:@"我的" imageName:@"me2" selectedImageName:@"me1"];
  
    
    
}
-(void)addSoundChildViewController:(UIViewController *)childVc WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.tabBarItem.title=title;
    //    childVc.navigationItem.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
//    if ([DeviceInfo isiOS7plus]) {
//        selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
    
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage=selectedImage;
    //未选中字体颜色,字体大小
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:122/255.0 green:126/255.0 blue:131/255.0 alpha:1];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //选中字体颜色
    NSMutableDictionary *selectedAttrs=[NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    selectedAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:122/255.0 green:126/255.0 blue:131/255.0 alpha:1];
    [childVc.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:childVc];
    
}
-(void)addOrderChildViewController:(UIViewController *)childVc WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    childVc.tabBarItem.title=title;
    //    childVc.navigationItem.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
//    if ([DeviceInfo isiOS7plus]) {
//        selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage=selectedImage;
    //未选中字体颜色,字体大小
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:122/255.0 green:126/255.0 blue:131/255.0 alpha:1];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //选中字体颜色
    NSMutableDictionary *selectedAttrs=[NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    selectedAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:122/255.0 green:126/255.0 blue:131/255.0 alpha:1];
    [childVc.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:childVc];
    
}
-(void)addChildViewController:(UIViewController *)childVc WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    childVc.tabBarItem.title=title;
    //    childVc.navigationItem.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
//    if ([DeviceInfo isiOS7plus]) {
//        selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.selectedImage=selectedImage;
    //未选中字体颜色,字体大小
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //选中字体颜色
    NSMutableDictionary *selectedAttrs=[NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    selectedAttrs[NSForegroundColorAttributeName]=[UIColor blueColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    YQNavigationController *nc=[[YQNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nc];
}



@end
