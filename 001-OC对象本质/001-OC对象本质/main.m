//
//  main.m
//  001-OC对象本质
//
//  Created by luokan on 2019/6/29.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


@interface Student : NSObject
{
@public
    int  _no;
    int  _age;
}

@end

@implementation Student


@end

// OC 中NSObject 的定义
//@interface NSObject{
//    Class isa  OBJC_ISA_AVAILABILITY;
//}

// 编译后 NSObject的实现
struct NSObject_IMPL {
    Class isa;
};


struct Student_IMPL {
    struct NSObject_IMPL NSOject_IVARS;
    int _no;
    int _age;

};

/**
 1.一个NSObject 占用多少内存?
 答： 实际占用   8个字节
     系统分配的 16个字节
 */
void test01(){
    
    NSObject * obj = [[NSObject alloc] init];
    
    
    //1. 获取class 对象的实例对象 大小
    size_t obj_size = class_getInstanceSize([NSObject class]);
    
    NSLog(@"实例对象的内存大小:%ld\n",obj_size); // 真实占用内存 8 个字节
    
    //2. 获取系统分配的大小
    size_t mallocSize =  malloc_size((__bridge const void *)(obj));
     NSLog(@"系统分配的内存大小:%ld\n",mallocSize); // 系统分配 16 个字节
    
}


/**
 2. OC 对象的本质？
 答：是一个结构体指针
 */
void test02(){
    NSObject *obj = [[NSObject alloc] init];
    
    struct NSObject_IMPL *pl = (__bridge struct NSObject_IMPL *)obj;
    
    NSLog(@"obj = %p\n",obj);//0x103908020
    
    NSLog(@"isa = %p\n",pl->isa);//0x1dffff974ee141
    
    //NSObject *obj = objc_msgSend
    //    (objc_msgSend
    //     (
    //      (id)objc_getClass("NSObject")
    //      , sel_registerName("alloc")
    //      ),
    //     sel_registerName("init")
    //     );
    
    // 等价=>
    
    //    id objValue =  objc_getClass("NSObject"); // 返回类对象
    //    SEL sel_1 = sel_registerName("alloc");
    
    //    SEL sel_2 = sel_registerName("init");
    
}


// Class 是个结构体指针的 别名
//typedef struct objc_class* Class;


/**
 3. Student 对象 占用多少内存?
   答： 结构体占用了16字节   系统分配了16字节
       isa(8) + _age(4) + _no(4)  = 16 字节
 */
void test03(){
    
    Student *st = [[Student alloc] init];
    st->_no = 1;
    st->_age = 18;
    
    size_t size_1= class_getInstanceSize([Student class]);
    
    size_t size_2 = malloc_size((__bridge const void *)(st));
    
    NSLog(@"size1 = %zd\nsize2 = %zu\n",size_1,size_2);
    
    
    struct Student_IMPL * stimp = (__bridge struct Student_IMPL *)st;
    
    NSLog(@"no = %d\n age = %d\n",stimp->_no,stimp->_age);
    
}

int main(int argc, const char * argv[]) {

//    test01();
    
//    test02();
    
    test03();
    
    return 0;
}
