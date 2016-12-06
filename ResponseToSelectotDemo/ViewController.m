//
//  ViewController.m
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//




#import "ViewController.h"
#import "NewViewController.h"
#import "ProtocolDemoClass.h"
#import "AppDelegate.h"

@interface ViewController ()<DemoProtocol,ChildProtocol>

@property(nonatomic,strong)UILabel *methodALabel;

@property(nonatomic,strong)UILabel *methodBLabel;

@property(nonatomic,strong)UILabel *methodCLabel;

@property(nonatomic,strong)UILabel *methodDLabel;

@property(nonatomic,strong)UIButton *convertBtn;

@end

@implementation ViewController

-(CGFloat)wj_width{

    return self.view.frame.size.width;
}

-(CGFloat)wj_height{

    return self.view.frame.size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
}

-(void)configureUI{

    self.methodALabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60,self.wj_width  -60, 40)];
    self.methodALabel.text = @"methodA未执行";
    [self.view addSubview:self.methodALabel];
    
    self.methodBLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120,self.wj_width  -60, 40)];
    self.methodBLabel.text = @"methodB未执行";
    [self.view addSubview:self.methodBLabel];
    
    self.methodCLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180,self.wj_width  -60, 40)];
    self.methodCLabel.text = @"methodC未执行";
    [self.view addSubview:self.methodCLabel];
    
    self.methodDLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 240,self.wj_width  -60, 40)];
    self.methodDLabel.text = @"methodD未执行";
    [self.view addSubview:self.methodDLabel];
    
    self.convertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.convertBtn setTitle:@"跳转" forState:UIControlStateNormal];
    self.convertBtn.frame  = CGRectMake(40, 300, 80, 30);
    [self.convertBtn addTarget:self action:@selector(wj_convert) forControlEvents:UIControlEventTouchUpInside];
    [self.convertBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.convertBtn];
}


-(void)wj_convert{

    NewViewController *vc = [[NewViewController alloc] init];
#if ChangeProtocolState
    vc.protocolClass = [[ProtocolDemoClass alloc] init];
    vc.protocolClass.delegate = self;
#else
    vc.childProtocolClass = [[ChildProtocolDemoClass alloc] init];
    vc.childProtocolClass.childDelegate = self;
#endif
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ---- delegtate

-(void)demoMethodA{
    self.methodALabel.text = @"methodA执行了";
}

-(void)demoMethodB{
    self.methodBLabel.text = @"methodB执行了";
}



-(void)demoMethodC{
    self.methodCLabel.text = @"methodC执行了";
}

-(void)demoMethodD{
   self.methodDLabel.text = @"methodD执行了";
}

@end
