//
//  NetWorker.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "NetWorker.h"

@implementation NetWorker

+(RACSignal*)loginByUsername:(NSString*)name password:(NSString*)password{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:[NSString stringWithFormat:@"User %@,Password %@, login!",name,password]];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}



@end
