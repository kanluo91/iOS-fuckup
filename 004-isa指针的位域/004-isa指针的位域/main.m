//
//  main.m
//  004-isa指针的位域
//
//  Created by luokan on 2019/7/1.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persion.h"
#import <objc/message.h>

void test01(){
    
    size_t s1 = sizeof(BOOL); //  1个字节
    size_t s2 = class_getInstanceSize([Persion class]);// 16个字节
    
    // s2 为什么是8个字节：isa 8 个字节  变量 3个字节   必须为16的倍数  所以为16字节
    
    NSLog(@"s1 = %zu\n",s1);
    NSLog(@"s2 = %zu\n",s2);
    
};

int main(int argc, const char * argv[]) {

  
    test01();

    
    
    
    
    return 0;
}
