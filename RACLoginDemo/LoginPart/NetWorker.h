//
//  NetWorker.h
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/26.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetWorker : NSObject

+(RACSignal*)loginByUsername:(NSString*)name password:(NSString*)password;


@end

NS_ASSUME_NONNULL_END
