//
//  Persion.m
//  day19-msgSend方法调用
//
//  Created by luokan on 2019/7/16.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "Persion.h"

@implementation Persion

//@synthesize age = _abc;
@dynamic age;

//-(void)run{
//    NSLog(@"%s\n",__func__);
//}

-(void) haha{
//    NSLog(@"abc = %d\n",_abc);
}

-(void)print{
    NSLog(@"xxxx 调用了print:%@",self);
    
    
}

#pragma mark -
#pragma mark 2. 动态方法解析
-(void) testAddMethod{
    NSLog(@"XXXXXX------testAddMethod----");

}


/**
 默认参数

 @param self 自己的引用
 @param _cmd 方法编号
 */
void testAddMethod2(id self,SEL _cmd){
    
    NSLog(@"XXXXXX------testAddMethod2----");
}

#pragma mark -
#pragma mark 动态解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    // 1. 动态添加已经有的方法
//    Method mt = class_getInstanceMethod([self class],@selector(testAddMethod));
//
//    const char *typeEncoding =  method_getTypeEncoding(mt);
//    IMP imp = method_getImplementation(mt);
//
//    class_addMethod([self class], sel, imp, typeEncoding);
    
    // 2. 动态添加C 语言方法
    class_addMethod([self class], sel,(IMP) testAddMethod2, "v@:");
    
    return YES;
}


#pragma mark -
#pragma mark 消息转发
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    
//}

@end
