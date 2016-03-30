//
//  YQHomeViewController.m
//  NoNaVDemo
//
//  Created by new on 16/3/29.
//  Copyright © 2016年 kydt. All rights reserved.
//

#import "YQHomeViewController.h"
#import "TestViewController.h"
@interface YQHomeViewController ()

@end

@implementation YQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TestViewController *testVc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:testVc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
