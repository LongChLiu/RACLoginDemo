//
//  OrderVC.m
//  RACLoginDemo
//
//  Created by 刘隆昌 on 2020/4/27.
//  Copyright © 2020 刘隆昌. All rights reserved.
//

#import "OrderVC.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "SubmitOrderHandler.h"


@interface OrderVC ()

@property(nonatomic,retain)UIButton* orderBtn;
@property(nonatomic,retain)SubmitOrderHandler* viewModel;
@property(nonatomic,retain)UIButton* changeAgreeBtn;

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];self.title = @"订单处理";
    // Do any additional setup after loading the view.
    [self makeUI];self.view.backgroundColor = [UIColor whiteColor];
    
    self.viewModel = [[SubmitOrderHandler alloc] init];
    
    /*
    self.orderBtn.rac_command = [[RACCommand alloc] initWithEnabled:RACObserve(self.viewModel, agreeProtocol) signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self.viewModel submitOrder];
    }];
    
    [[self.orderBtn.rac_command.executionSignals flatten] subscribeNext:^(id  _Nullable x) {
        NSLog(@"+++++++++++: %@",x);
    }];

    [self.orderBtn.rac_command.errors subscribeNext:^(NSError * _Nullable x) {

    }];
     */
    
    /*
     //用materialize Operation。它把 Next、Error、Complete 都包装成RACEvent，通过 sendNext 传送。使逻辑和代码更集中
    self.orderBtn.rac_command = [[RACCommand alloc] initWithEnabled:RACObserve(self.viewModel, agreeProtocol) signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [[self.viewModel submitOrder] materialize];
    }];    
    
    [[self.orderBtn.rac_command.executionSignals flatten] subscribeNext:^(RACEvent*  _Nullable event) {
        
        if ([event eventType] == RACEventTypeNext) {
            id value = [event value];
            
            NSLog(@"-----------: %@",value);
            
        }else if([event eventType] == RACEventTypeError){
            NSError* error = [event value];
            
            NSLog(@"---------++: %@",error);
            
        }
    }];;
    */
    
    
    //实时网络请求
    [[[[[RACSignal combineLatest:@[] reduce:^id _Nonnull(id paramA,id paramB){
        
        return paramA;
        
    }] distinctUntilChanged] map:^id _Nullable(id  _Nullable value) {
        
        return [self.viewModel submitOrder];
        
    }] switchToLatest] subscribeNext:^(id  _Nullable x) {
        
    }];
    
    
   
    
    
    
    
    
}


-(void)makeUI{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(180);
        make.height.mas_equalTo(40);
    }];self.orderBtn = btn;
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"提交订单" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    __weak OrderVC* weakSelf = self;
    UIButton* changeAgreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:changeAgreeBtn];
    [changeAgreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(btn.mas_bottom).offset(80);
        make.height.mas_equalTo(40);
    }];self.changeAgreeBtn = changeAgreeBtn;
    changeAgreeBtn.backgroundColor = [UIColor cyanColor];
    [changeAgreeBtn setTitle:@"转换同意状态" forState:UIControlStateNormal];
    
    [[changeAgreeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
        weakSelf.viewModel.agreeProtocol = !weakSelf.viewModel.agreeProtocol;
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
