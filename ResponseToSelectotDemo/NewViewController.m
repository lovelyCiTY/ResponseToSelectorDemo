//
//  NewViewController.m
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//

#import "NewViewController.h"
#import "ProtocolDemoClass.h"
#import "AppDelegate.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    
}

-(void)configureUI{
    for (NSInteger i = 0; i < 4; i++) {
        [self creatBtnWithFrame:CGRectMake(30, i * 40 + 80, 150, 30) title:[NSString stringWithFormat:@"改变方法%@",@(i)] tag:i];
    }
}

-(void)creatBtnWithFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger )tag{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame  = frame;
    btn.tag = tag;
    [btn addTarget:self action:@selector(changeLabelState:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

-(void)changeLabelState:(UIButton *)button{

#if ChangeProtocolState
    if (button.tag == 0) {
        if (self.protocolClass && [self.protocolClass checkTypeSame:DemoProtocolStateMethodA selector:@selector(demoMethodA)]) {
            [self.protocolClass.delegate demoMethodA];
        }
    }else if (button.tag ==1){
        if (self.protocolClass && [self.protocolClass checkTypeSame:DemoProtocolStateMethodB selector:@selector(demoMethodB)]) {
            [self.protocolClass.delegate demoMethodB];
        }
    }
#else
    if (button.tag == 0) {
        if (self.childProtocolClass &&  [self.childProtocolClass checkTypeSame:DemoProtocolStateMethodA selector:@selector(demoMethodA)]) {
            [self.childProtocolClass.childDelegate demoMethodA];
        }
    }else if (button.tag ==1){
    
        if (self.childProtocolClass && [self.childProtocolClass checkTypeSame:DemoProtocolStateMethodB selector:@selector(demoMethodB)]) {
            [self.childProtocolClass.childDelegate demoMethodB];
        }
    }else if (button.tag == 2){
        if (self.childProtocolClass && [self.childProtocolClass checkTypeSame:DemoProtocolStateMethodC selector:@selector(demoMethodC)]) {
            [self.childProtocolClass.childDelegate demoMethodC];
        }
    }else if (button.tag == 3){
        if (self.childProtocolClass && [self.childProtocolClass checkTypeSame:DemoProtocolStateMethodD selector:@selector(demoMethodD)]) {
            [self.childProtocolClass.childDelegate demoMethodD];
        }
    }
#endif
}








@end
