//
//  SubmitOrderHandler.h
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/27.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>


NS_ASSUME_NONNULL_BEGIN

@interface SubmitOrderHandler : NSObject

@property(nonatomic,assign)BOOL agreeProtocol;

-(RACSignal*)submitOrder;



@end

NS_ASSUME_NONNULL_END
