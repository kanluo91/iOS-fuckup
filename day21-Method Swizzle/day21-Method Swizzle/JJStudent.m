//
//  JJStudent.m
//  day21-Method Swizzle
//
//  Created by luokan on 2019/7/18.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "JJStudent.h"
#import <objc/message.h>

@implementation JJStudent


void printClassMethods(Class clz){
    unsigned int count;
    Method *mList = class_copyMethodList(clz, &count);
    
    for (int i = 0; i<count; i++) {
        Method method = mList[i];
        SEL sel = method_getName(method);
        NSString *mName = NSStringFromSelector(sel);
        NSLog(@"xxxxxxxxxxx方法名字:%@\n",mName);
    }
    if(mList != NULL){
       free(mList);
    }
}

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class pClz = objc_getClass("JJStudent");
        
        SEL originSel = @selector(makeMoney:);
        SEL swizzleSel = @selector(jj_makeMoney:);
        
        Method originMethod = class_getInstanceMethod(pClz,originSel);
        Method swizzleMethod = class_getInstanceMethod(pClz, swizzleSel);
        
        //1. 如果M1 为空
       BOOL addSucc =  class_addMethod(pClz, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
        
        if(addSucc){// 原类中没有
            class_replaceMethod(pClz, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
            
        }else{ // 原类中有这个方法  直接替换method
            method_exchangeImplementations(originMethod, swizzleMethod);
            
        }
        
        printClassMethods(pClz);
    });
}


-(void) study:(NSString *) something{
    NSLog(@"学习学习:%@\n",something);
}

-(void)jj_makeMoney:(NSString *)something{
    NSLog(@"学生赚钱:%@\n",something);
}

@end
