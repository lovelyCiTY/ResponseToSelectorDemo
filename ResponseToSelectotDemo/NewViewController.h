//
//  NewViewController.h
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProtocolDemoClass.h"

@interface NewViewController : UIViewController

@property(nonatomic,strong)ProtocolDemoClass *protocolClass;

@property(nonatomic,strong)ChildProtocolDemoClass *childProtocolClass;

@end
