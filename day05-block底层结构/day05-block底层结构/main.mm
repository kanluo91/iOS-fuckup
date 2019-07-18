//
//  main.m
//  day05-block底层结构
//
//  Created by luokan on 2019/7/10.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persion.h"

int c = 300;

#pragma mark -
#pragma mark 变量的捕获
void test01(){
    int a = 100;
    static int b = 200;
    void (^myBlock)(void) =^(void){
        NSLog(@"a = %d\n",a);
        NSLog(@"b = %d\n",b);
        NSLog(@"c = %d\n",c);
    };
    myBlock();
}


#pragma mark -
#pragma mark __block 的作用
void test02(){
    
    __block int a = 100;
    void (^changeValueBlock)(int) = ^(int b){
        a+=b;
    };
    changeValueBlock(200);
    
    printf("a = %d\n",a);
    
    
//    //1: __block int a = 10;
//    __attribute__((__blocks__(byref))) __Block_byref_a_0 a = {(void*)0,(__Block_byref_a_0 *)&a, 0, sizeof(__Block_byref_a_0), 100};
//
//    //2: 定义block
//    void (*changeValueBlock)(int) = ((void (*)(int))&__test02_block_impl_0((void *)__test02_block_func_0, &__test02_block_desc_0_DATA, (__Block_byref_a_0 *)&a, 570425344));
//
//    //3： 调用block
//    ((void (*)(__block_impl *, int))((__block_impl *)changeValueBlock)->FuncPtr)((__block_impl *)changeValueBlock, 200);
//
//    //4：打印输出
//    printf("a = %d\n",(a.__forwarding->a));
    
}


void test03()
{
    void(^blockStyle)()= ^(){
    };
    Class clz = [blockStyle class];
    Class superClz = [clz superclass];
    Class superSuperClz = [superClz superclass];
    Class superSuperSuperClz = [superSuperClz superclass];
    
    NSLog(@"\n%@\n%@\n%@\n%@\n",NSStringFromClass(clz),NSStringFromClass(superClz),NSStringFromClass(superSuperClz),superSuperSuperClz);
    
    //    __NSGlobalBlock__
    //    __NSGlobalBlock
    //    NSBlock
    //    NSObject
}

#pragma mark -
#pragma mark block __strong
void test04(){
    
    // gcd 的block 会自动进行copy操作，这样block 在堆上
    Persion *p = [[Persion alloc] init];

    // 堆上的block 进行copy的时候 回对persion 进行retain操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%p",p);
    });
    
    // 释放的时候会调用 dispose 函数 进行realease操作
}

#pragma mark -
#pragma mark block __weak
void test05(){
    
    Persion *p = [Persion new];
    
    // gcd 对block 进行了copy 操作 使得block 在堆上
    // block 在copy操作的时候 会对引用的对象进行相应的操作
    // 因为是weak 属性，所以引用计数器不变
    // 但是 p对象在函数执行完之后马上就释放了，block 的声明周期需要3秒后执行完才释放
    // 所以当block执行的时候 weakP 为NULL
    __weak Persion *weakP = p;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%p",weakP);
    });
    
}


#pragma mark -
#pragma mark block __weak __strong
void test06()
{
    Persion *p = [Persion new];
    __weak Persion *weakP = p;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"weakP = %@\n",weakP);
        __strong Persion *strongP = weakP;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"strongP = %@\n",strongP);
        });
    });
}

int main(int argc, const char * argv[]) {
    
//    test04();
    
//    test05();
    
    test06();

    return 0;
}

/* __block 的作用
__attribute__((__blocks__(byref))) __Block_byref_a_0 a = {(void*)0,(__Block_byref_a_0 *)&a, 0, sizeof(__Block_byref_a_0), 100};
void (*changeValueBlock)(int) = ((void (*)(int))&__test02_block_impl_0((void *)__test02_block_func_0, &__test02_block_desc_0_DATA, (__Block_byref_a_0 *)&a, 570425344));
((void (*)(__block_impl *, int))((__block_impl *)changeValueBlock)->FuncPtr)((__block_impl *)changeValueBlock, 200);

printf("a = %d\n",(a.__forwarding->a));
 */

/*  变量的捕获：生成如下结构
int c = 300;
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int a;
    int *b;
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _a, int *_b, int flags=0) : a(_a), b(_b) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};
*/
