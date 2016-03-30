//
//  TestViewController.m
//  NoNaVDemo
//
//  Created by new on 16/3/29.
//  Copyright © 2016年 kydt. All rights reserved.
//

#import "TestViewController.h"
#import "test1ViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
     [self setViewTitle:@"我一个人在这"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100,100,100,100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(ssssss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)ssssss {

    [self pushVC:[[test1ViewController alloc]init] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
