//
//  main.m
//  day19-msgSend方法调用
//
//  Created by luokan on 2019/7/16.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persion.h"
#import <objc/message.h>
#import "HumanBeen.h"

//Persion *p = ((Persion *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Persion"), sel_registerName("new"));
//
//((void (*)(id, SEL))(void *)objc_msgSend)((id)p, sel_registerName("run"));


void test01(){
    Persion *p = [Persion new];
    
    [p run];
    
    // 方法签名
    SEL newSel = sel_registerName("new");
    SEL runSel = sel_registerName("run");
    // 获取类对象
    Class pClz = objc_getClass("Persion");
    
    Persion *p1 = (
                   // 因为调用了new 函数 返回的是Persion *
                   (Persion *(*)(id, SEL))
                   // 调用的是objc_msgSend函数 返回的是void*
                   (void *)objc_msgSend
                   )
    (pClz, newSel);
    
    ((void (*)(id, SEL))(void *)objc_msgSend)((id)p1, runSel);
}


void test02(){
    
    id cls = [Persion class];  // 类对象 == isa
//    struct persion_xxxxx {
//        isa_t isa,
//        class suepr_class,
//        xxxx
//    };
    void *obj = &cls; // 类似实例对象
    [(__bridge id)obj print];
    
//----
    
    Persion *p = [Persion new];

    [p run];
    
    //objc_msgSend((void *)p,@selector(run));
}


void test3(){
    
    Persion *p = [[Persion alloc] init];
    
    object_setClass(p, [HumanBeen class]);
    
    Class clz = [p class];
    
    NSLog(@"Clz = %@\n",NSStringFromClass(clz));
    
}


void test04(){
    
    
}


void zhualaoshu(void){
    
    printf("抓老鼠=========\n");
    
}

void test05(){
    
    NSString * newClassStr = @"JJCat";
    // 创建一个新的类
    Class newClz =objc_allocateClassPair([NSObject class], newClassStr.UTF8String, 0);
    // 动态添加成员变量
    class_addIvar(newClz, "_age", sizeof(int), 1, @encode(int));
    // 添加方法
    class_addMethod(newClz, @selector(zhualaoshu),(IMP)zhualaoshu,"v@:");
    
    objc_registerClassPair(newClz);
    
    size_t st = class_getInstanceSize(newClz);
    printf("class_getInstanceSize(newClz) = %zd\n",st); // 16 (isa:8   int:4   对齐后16)
    
    // 创建实例
    id instance = [[newClz alloc] init];
    [instance setValue:@20 forKey:@"age"];
    int age = [[instance valueForKey:@"age"] intValue];
    
    [instance performSelector:@selector(zhualaoshu)];
    printf("age =  %d\n",age);
    
}

int main(int argc, const char * argv[]) {


//    test01();
    
//    test02();
    
//    test3();
    
//    test04();
    
    test05();
    
    return 0;
}
