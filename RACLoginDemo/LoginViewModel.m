//
//  LoginViewModel.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "LoginViewModel.h"
#import "NetWorker.h"

@implementation LoginViewModel


-(instancetype)init{
    if (self = [super init]) {
        
        RACSignal* usernameLengthSignal = [RACObserve(self, userName) map:^id _Nullable(NSString*  _Nullable value) {
            if (value.length > 6) {return @(YES);}
            return @(NO);
        }];
        
        RACSignal* passwordLengthSignal = [RACObserve(self, password) map:^id _Nullable(NSString*  _Nullable value) {
            if (value.length > 6) {return @(YES);}
            return @(NO);
        }];
        
        RACSignal* loginBtnEnable = [RACSignal combineLatest:@[usernameLengthSignal,passwordLengthSignal] reduce:^id _Nonnull(NSNumber* username,NSNumber* password){
            return @([username boolValue] && [password boolValue]);
        }];
        
        _loginCommand = [[RACCommand alloc] initWithEnabled:loginBtnEnable signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [NetWorker loginByUsername:self.userName password:self.password];
        }];
        
    }
    return self;
}




@end
