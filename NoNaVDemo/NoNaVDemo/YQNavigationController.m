//
//  YQNavigationController.m
//  YqTong
//
//  Created by new on 16/3/23.
//  Copyright © 2016年 wcw. All rights reserved.
//

#import "YQNavigationController.h"


@interface YQNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property(nonatomic, weak) UIViewController *currentShowVC;


@end

@implementation YQNavigationController
+(void)initialize{
    [self setBarButtonTheme];
    [self setNavigationBarItemTheme];
}
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    YQNavigationController *nav = [super initWithRootViewController:rootViewController];
    nav.interactivePopGestureRecognizer.delegate = self;
    nav.delegate = self;
    
    return nav;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.enabled = NO; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
//         viewController.navigationItem.backBarButtonItem  =[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    if (self.viewControllers.count>0) {
//        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem barButtonItemWithImageName:@"arrow_left" highImageName:@"arrow_left_click" target:self action:@selector(back)];
        UIButton *backButton = [[UIButton alloc]init];
        backButton.frame =CGRectMake(0, 0, 80, 35);
        [backButton addTarget:self action:@selector(back)forControlEvents:UIControlEventTouchUpInside];
        [backButton setImage:[UIImage imageNamed:@"goback"] forState:UIControlStateNormal];
        
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
        
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
         backButton.titleEdgeInsets = UIEdgeInsetsMake(2, -95, 0, 0);
        
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        viewController.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        

      
        //        viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem barButtonItemWithImageName:@"" highImageName:@"" target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self popViewControllerAnimated:YES];
}
//-(void)more{
//    [self popToRootViewControllerAnimated:YES];
//
//}
+(void)setNavigationBarItemTheme{
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    
    UINavigationBar *apperance=[UINavigationBar appearance];
    NSMutableDictionary *textAttr=[NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName]=[UIColor whiteColor];
    textAttr[NSFontAttributeName]=[UIFont systemFontOfSize:18];
    [apperance setTitleTextAttributes:textAttr];
    
}
+(void)setBarButtonTheme{
    //设置barButton的颜色
    //1.平时的颜色
    UIBarButtonItem *appearance=[UIBarButtonItem appearance];
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName]=[UIColor blueColor];
    [appearance setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    
    //2.高亮的颜色
    //    UIBarButtonItem *appearanceH=[UIBarButtonItem appearance];
    //    NSMutableDictionary *attrH=[NSMutableDictionary dictionary];
    //    attrH[NSForegroundColorAttributeName]=[UIColor blackColor];
    //    [appearanceH setTitleTextAttributes:attrH forState:UIControlStateHighlighted];
    
    //3.disable的颜色
    UIBarButtonItem *appearanceD=[UIBarButtonItem appearance];
    NSMutableDictionary *attrD=[NSMutableDictionary dictionary];
    attrD[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    [appearanceD setTitleTextAttributes:attrD forState:UIControlStateDisabled];
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (1 == navigationController.viewControllers.count) {
        self.currentShowVC = nil;
    } else {
        self.currentShowVC = viewController;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return (self.currentShowVC == self.topViewController);
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        return YES;
    } else {
        return NO;
    }
}
-(BOOL)navigationShouldPopOnBackButton{

    return YES;
}
@end
