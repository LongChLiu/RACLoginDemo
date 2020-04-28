//
//  SubmitOrderHandler.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/27.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "SubmitOrderHandler.h"

@implementation SubmitOrderHandler



-(RACSignal*)submitOrder{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"订单已经提交"];
            [subscriber sendCompleted];
        });
        
        return nil;
    }];
}


@end
