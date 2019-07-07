//
//  main.m
//  003-isa指针
//
//  Created by luokan on 2019/6/30.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "JJPersion.h"
#import "JJStudent.h"
#import "NSObject+test.h"


//struct objc_classXX {
//    Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
//};
//
//typedef struct objc_classXX *ClassX;
//
//struct NSObject_IMPL {
//    ClassX isa;
//};
//
//
//struct Student_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
//    NSString *_name;
//    int _age;
//};




/**
 1. isa 指针  和 super_class 指针
 */
void test01(){
    
    JJStudent *st = [[JJStudent alloc] init];
    st->_name = @"金角大王";
    st->_weight = 29;
    
    
    /* 调用流程
     * 1. st 的isa 找到 Student类对象
     * 2. 查找类对象中的方法列表 sel1
     * 3. objc_msgSend(st,sel1)
     */
    [st studentInstanceMethod];
    
    /* 调用流程
     * 1. st 的isa 找到 Student类对象
     * 2. Student类对象中的super_class 找到父类Persion的类对象
     * 3. Persion类对象中查找方法 sel2
     * 4. objc_msgSend(st,sel2)
     */
    [st persionInstanceMethod];
    
    
    /* 调用流程
     * 1. [JJStudent class] 获取类对象 classObj
     * 2. classObj中的isa 找到 元类对象 meta-Class
     * 3. 元类对象中查找 类方法 sel3
     * 4. objc_msgSend([JJStudent class],sel3)
     */
    [JJStudent studentClassMethod];
    
    /* 调用流程
     * 1. [JJStudent class] 获取类对象 classObj
     * 2. classObj中的isa 找到 Student元类对象 meta-Class
     * 3. Student元类对象中查找 类方法 sel3 没找到
     * 4  Student meta-class的super_class到 Persion元类中查找 sel4
     * 5. objc_msgSend([JJStudent class],sel4)
     */
    [JJStudent persionClassMethod];
    
    
    
}

/**
 superclass 调用流程
 基类 元类对象的`superclass` 指向基类的类对象
 */
void test02(){
    
    [JJPersion test];
    
    [NSObject test];
    
    // NSObject - Test
    // NSObject - Test
}

/**
 isa 地址计算方法
 */
void test03(){
    
    JJPersion *p = [[JJPersion alloc] init];
    Class pClazz = [JJPersion class];
    Class pMetaClazz = object_getClass(pClazz);
    NSLog(@"\n%p\n%p\n%p\n",p,pClazz,pMetaClazz);
//    0x100507030  计算isa 0x001d8001000024d1
//    0x1000024d0
//    0x1000024f8
    
    /*
     * 实例对象p 0x100507030
     * p/x p->isa 得到类对象地址 0x001d8001000024d1
     * 类对象地址： 0x1000024d0
     * 为什么2个结果不一样呢？
     * oc 在计算 类对象地址的时候  是用真实地址  isaAddress&ISA_MASK
     *  define ISA_MASK        0x00007ffffffffff8ULL
     
     */
//    unsigned long long * resut = 0x001d8001000024d1 & 0x00007ffffffffff8ULL;
//    NSLog(@"result = %p\n",resut); //result = 0x1000024d0
}

int main(int argc, const char * argv[]) {

//    test01();
//    test02();
    test03();
    
    
    return 0;
}
