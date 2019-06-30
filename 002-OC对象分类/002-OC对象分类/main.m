//
//  main.m
//  002-OC对象分类
//
//  Created by luokan on 2019/6/29.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

/*
 * 一： OC对象分类
 *  1. 实例对象（成员变量）
 *  2. 类对象  一个类的类对象是唯一的
 *  3. 元类对象
 */

@interface Persion : NSObject
{
    @public
    int _age;
    int height;
    NSString *_name;
}

@end

@implementation Persion

@end


/**
 实例对象
 */
void test01(){
    
    Persion *p = [[Persion alloc] init];
 
    
}


/**
 类对象
 */
void test02(){
    
    Persion *p = [[Persion alloc] init];
    
    // 1. 获取类对象方法一
    Class pClz1 = [Persion class];
    
    // 2. 获取类对象方法二
    Class pClz2 = objc_getClass("Persion");
    
    // 3. 获取类对象方法三
    Class pClz3 = object_getClass(p);
    
    printf("类对象1 = %p\n",pClz1);
    printf("类对象2 = %p\n",pClz2);
    printf("类对象3 = %p\n",pClz3);
//    类对象1 = 0x100001120
//    类对象2 = 0x100001120
//    类对象3 = 0x100001120
    
}


/**
 元类对象
 */
void test03(){
    
    Persion *p = [[Persion alloc] init];
    
    Class pClz1 = object_getClass(p);
    
    Class metaClz = object_getClass(pClz1);
    
    printf("类对象：%p\n",pClz1);
    printf("元类对象：%p\n",metaClz);
    
//    类对象：0x100001120
//    元类对象：0x1000010f8
    
    // 判断是否为元类对象
    BOOL b1 =  class_isMetaClass(pClz1);
    BOOL b2 = class_isMetaClass(metaClz);
//    NO
//    YES
    
    NSLog(@"\n%@\n%@\n",b1?@"YES":@"NO",b2?@"YES":@"NO");
}

int main(int argc, const char * argv[]) {

//    test01();
    
//    test02();
    
    test03();
    
    
    
    return 0;
}
