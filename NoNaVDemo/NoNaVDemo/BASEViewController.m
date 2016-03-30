//
//  BASEViewController.m
//  NoNaVDemo
//
//  Created by new on 16/3/29.
//  Copyright © 2016年 kydt. All rights reserved.
//
#import "ZHDragButton.h"
#import "BASEViewController.h"
#import "UIView+Extension.h"
#define fHEIGHT          ([UIScreen mainScreen].bounds.size.height)
#define fWIDTH           ([UIScreen mainScreen].bounds.size.width)
#define btnW             100
#define btnW1            50

#define titleFont        16
@interface BASEViewController ()<DragAnimationDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic)ZHDragButton *DragBtn;
@property (weak, nonatomic)UIButton *btn1;
@end

@implementation BASEViewController
static int titleW;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(![self isEqual:self.navigationController.viewControllers[0]])
    {
        ZHDragButton *DragBtn = [[ZHDragButton alloc] initWithFrame:CGRectMake(fWIDTH - 80, fHEIGHT*0.5, 80, 80)];
        DragBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [DragBtn setTitle:@"返回" forState:UIControlStateNormal];
        [DragBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.DragBtn = DragBtn;
        DragBtn.delegate = self;
        DragBtn.dragEnable = YES;
        
#warning 这里不能使用按钮的addTarget方法添加点击事件，我试了下手势可以。可搜索---Button与touchesBegan响应冲突的问题 了解。
        
        UITapGestureRecognizer *oneFingerTwoTaps =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
        [DragBtn addGestureRecognizer:oneFingerTwoTaps];
        
        [[UIApplication sharedApplication].keyWindow addSubview:DragBtn];
        
        
        
        
        UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(DragBtn.width, 20, 0, 40)];
        btn1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.btn1 = btn1;
        [btn1.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
        
        UIFont *fnt = [UIFont systemFontOfSize:titleFont];
        CGSize size = [@"本页十分精彩" sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
        titleW = size.width+20;
        
        [self.btn1 setTitle:@"本页十分精彩"  forState:UIControlStateNormal];
        
        
        btn1.layer.cornerRadius = (40)/2.0;
        
        btn1.layer.masksToBounds = YES;
        
        self.btn1.hidden = YES;
        [DragBtn addSubview:btn1];
        
    }
}

- (void)oneFingerTwoTaps {
    self.DragBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];

    self.btn1.width = 0;
    [self.DragBtn removeFromSuperview];
   [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)startDragAnimation
{
    self.DragBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    //    [UIView animateWithDuration:0.3 animations:^{
    //        self.btn1.width = 100;
    //    }];
    
}
- (void)moveDragAnimationLeft
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.btn1.hidden = NO;
        self.btn1.width = titleW;
        self.btn1.x = self.DragBtn.width;
    }];
}
- (void)moveDragAnimationRight
{
    [UIView animateWithDuration:0.3 animations:^{
        self.btn1.hidden = NO;
        self.btn1.width = titleW;
        self.btn1.x = -titleW;
    }];
}
- (void)endDragAnimation
{
    self.DragBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [UIView animateWithDuration:0.3 animations:^{
        self.btn1.hidden = YES;
     
    }];
    
}
-(void)setViewTitle:(NSString *)title
{
    UIFont *fnt = [UIFont systemFontOfSize:titleFont];
    CGSize size = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    titleW = size.width+20;
    
    [self.btn1 setTitle:title forState:UIControlStateNormal];
}

-(void)pushVC:(UIViewController *)Vc animated:(BOOL)animated
{
    [self.DragBtn removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:Vc animated:animated];
    });

}
@end
