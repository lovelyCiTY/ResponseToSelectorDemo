//
//  ProtocolDemoClass.m
//  ResponseToSelectotDemo
//
//  Created by 王俊 on 16/12/6.
//  Copyright © 2016年 uhut. All rights reserved.
//

#import "ProtocolDemoClass.h"

@interface ProtocolDemoClass ()

@property(nonatomic,assign)DemoProtocolState protocol;

@end

@implementation ProtocolDemoClass

-(BOOL)checkTypeSame:(DemoProtocolState )type selector:(SEL) selector{
    if (!self.protocol) {
        self.protocol = 0;
    }
    if ( (self.protocol & type) == type) {
        return YES;
    }else{
        if ([self.delegate respondsToSelector:selector]) {
            self.protocol += type;
            return YES;
        }
    }
    return NO;
}

@end


@implementation ChildProtocolDemoClass

-(BOOL)checkTypeSame:(DemoProtocolState)type selector:(SEL)selector{

    if (!self.protocol) {
        self.protocol = 0;
    }
    if ( (self.protocol & type) == type) {
        return YES;
    }else{
        if ([self.childDelegate respondsToSelector:selector]) {
            self.protocol += type;
            return YES;
        }
    }
    return NO;
}



@end
