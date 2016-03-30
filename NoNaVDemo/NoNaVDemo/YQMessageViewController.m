//
//  YQMessageViewController.m
//  NoNaVDemo
//
//  Created by new on 16/3/29.
//  Copyright © 2016年 kydt. All rights reserved.
//

#import "YQMessageViewController.h"
#import "Test2ViewController.h"
@interface YQMessageViewController ()

@end

@implementation YQMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor yellowColor];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100,100,100,100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(ssssss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)ssssss {
    [self.navigationController pushViewController:[[Test2ViewController alloc]init] animated:YES];

    // Dispose of any resources that can be recreated.
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
