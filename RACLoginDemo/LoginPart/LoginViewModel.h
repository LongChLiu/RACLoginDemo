//
//  LoginViewModel.h
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>


NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject


@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* password;
@property(nonatomic,strong,readonly)RACCommand* loginCommand;


@end

NS_ASSUME_NONNULL_END
