//
//  LoginPartVC.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/27.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "LoginPartVC.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>



@interface LoginPartVC ()

@end

@implementation LoginPartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeUI];
    
    self.indicatorView.hidden = YES;
    _viewModel = [[LoginViewModel alloc] init];
    @weakify(self);
    RAC(self.viewModel,userName) = self.usernameInput.rac_textSignal;
    RAC(self.viewModel,password) = self.passwordInput.rac_textSignal;
    self.loginBtn.rac_command = self.viewModel.loginCommand;
    [[self.viewModel.loginCommand executionSignals] subscribeNext:^(RACSignal*  _Nullable x) {
        @strongify(self);
        self.indicatorView.hidden = NO;
        [x subscribeNext:^(NSString*  _Nullable x) {
            self.indicatorView.hidden = YES;
            NSLog(@"%@",x);
        }];
    }];
}



-(void)makeUI{
    
    __weak LoginPartVC* weakSelf = self;
    // Do any additional setup after loading the view.
    UITextField * usernameInput = [[UITextField alloc] init];
    [self.view addSubview:usernameInput];
    usernameInput.borderStyle = UITextBorderStyleLine;
    [usernameInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    self.usernameInput = usernameInput;
    
    
    UITextField * passwordInput = [[UITextField alloc] init];
    [self.view addSubview:passwordInput];
    passwordInput.borderStyle = UITextBorderStyleLine;
    [passwordInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.mas_equalTo(usernameInput.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    self.passwordInput = passwordInput;
    
    
    UIButton* loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginBtn];
    loginBtn.backgroundColor = [UIColor blackColor];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordInput.mas_bottom).offset(44);
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
    }];
    self.loginBtn = loginBtn;
    
    UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self.view addSubview:indicatorView];
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(50);
        make.width.height.mas_equalTo(80);
    }];
    self.indicatorView = indicatorView;
    
}




@end
