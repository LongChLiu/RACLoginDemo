//
//  ViewController.h
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

@interface ViewController : UIViewController

@property(strong,nonatomic)UITextField* usernameInput;
@property(strong,nonatomic)UITextField* passwordInput;
@property(strong,nonatomic)UIButton* loginBtn;
@property(strong,nonatomic)UIActivityIndicatorView* indicatorView;
@property(strong,nonatomic)LoginViewModel* viewModel;

@end

