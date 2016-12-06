//
//  AppDelegate.h
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//

#import <UIKit/UIKit.h>

//通过更改这里就能实现两种代理方法的相互切换了
#define ChangeProtocolState 0  //设置0 1 实现两种状态的切换

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

