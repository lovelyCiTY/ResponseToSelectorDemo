//
//  ProtocolDemoClass.h
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//

#import <Foundation/Foundation.h>

//这里也能看出来一个比较大的问题就是这样写会大大的加大程序的代码量  在这一点上能不能做什么优化呢？现在还没有想到比较好的方案，有什么好的办法，希望能够在我的简书上进行留言，很感激。

typedef NS_ENUM(NSInteger,DemoProtocolState) {
    
    //一套协议最好使用一套枚举 当然也在互相遵守的过程中最好写成一个枚举 但是一个协议继承自多个协议的情况 这个时候最好自己再写一个枚举 很复杂的情况其实感觉这样的方案代码有些过于冗余
    //对性能优化的要求不是特别严格可以先不考虑
    //如果是swift的方法的话其实这里就是其他的处理方案了  最近有时间在写一套swift对应的代码 感觉这样方式在swift更容易处理一些
    
    //DemoProtocol协议方法部分
    DemoProtocolStateMethodA = 1 << 1,
    DemoProtocolStateMethodB = 1 << 2,
    
    //ChildProtocol协议方法部分
    DemoProtocolStateMethodC = 1 << 3,
    DemoProtocolStateMethodD = 1 << 4,
    
    //这里还可以设置一些必须实现协议类型的状态 在初始化的时候直接设置上就行了
    
    
    DemoProtocolStateAll = DemoProtocolStateMethodA | DemoProtocolStateMethodB | DemoProtocolStateMethodC | DemoProtocolStateMethodD ,
    //这里如果方法很多了可以等于 0xFFFF
};


//这里展示到继承关系的protocol实现和一个类进行绑定的调用方案
@protocol DemoProtocol <NSObject>
-(void)demoMethodA;
-(void)demoMethodB;
@end

@protocol ChildProtocol <DemoProtocol>
-(void)demoMethodC;
-(void)demoMethodD;
@end

//这个就是对应的绑定类
@interface ProtocolDemoClass : NSObject

@property(nonatomic,weak)id <DemoProtocol> delegate;
-(BOOL)checkTypeSame:(DemoProtocolState )type selector:(SEL) selector;

@end

@interface ChildProtocolDemoClass : ProtocolDemoClass

@property(nonatomic,weak)id <ChildProtocol> childDelegate;

@end
