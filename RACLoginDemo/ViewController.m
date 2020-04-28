//
//  ViewController.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "ViewController.h"
#import "LoginPartVC.h"
#import "OrderVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)loginPartAction:(UIButton *)sender {
    LoginPartVC* vc = [[LoginPartVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)orderPartAction:(UIButton *)sender {
    OrderVC* orderVc = [[OrderVC alloc] init];
    [self.navigationController pushViewController:orderVc animated:YES];
}

@end
