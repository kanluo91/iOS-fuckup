//
//  main.m
//  day08-Block基础知识
//
//  Created by luokan on 2019/7/9.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 block基础知识
 */
void test01(){
    // 1 匿名block
    ^(){
        NSLog(@"我是一个匿名block");
    }();
    
    // 声明一个block
    void (^myblock)(int);
    
    myblock = ^(int a){
        NSLog(@"我是blockValue:%d\n",a);
    };
    
    myblock(10);
    
}

int main(int argc, const char * argv[]) {

    test01();
    
    return 0;
}
