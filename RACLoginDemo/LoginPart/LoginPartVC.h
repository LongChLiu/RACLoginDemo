//
//  LoginPartVC.h
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/27.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginPartVC : UIViewController

@property(strong,nonatomic)UITextField* usernameInput;
@property(strong,nonatomic)UITextField* passwordInput;
@property(strong,nonatomic)UIButton* loginBtn;
@property(strong,nonatomic)UIActivityIndicatorView* indicatorView;
@property(strong,nonatomic)LoginViewModel* viewModel;


@end

NS_ASSUME_NONNULL_END
