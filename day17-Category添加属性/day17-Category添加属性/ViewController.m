//
//  ViewController.m
//  day17-Category添加属性
//
//  Created by luokan on 2019/7/8.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *obj1 = [NSObject new];
    obj1.age = 100;
    
    NSObject *obj2 = [NSObject new];
    obj2.age = 200;
    
    [obj2 removeAllAssociate];

    printf("obj1:age =  %d\n",obj1.age);
    printf("obj2:age =  %d\n",obj2.age);
    
    // 获取ivar 验证下
    Class clz = [NSObject class];
    Class metaClz = object_getClass(clz);
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(clz, &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        printf("ivar = %s\n",ivarName);
    }
    
    // isa
    
    
}


@end
