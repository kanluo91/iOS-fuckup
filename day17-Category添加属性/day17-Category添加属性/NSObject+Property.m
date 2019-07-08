//
//  NSObject+Property.m
//  day17-Category添加属性
//
//  Created by luokan on 2019/7/8.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>


@implementation NSObject (Property)

#pragma mark 方法一： 弄个全局变量  不能保证每个Persion 都有个age
//int age_; /*全局变量存储age_*/
//-(void) setAge:(int)age{
//    age_ = age;
//}
//
//-(int) age{
//    return age_;
//}


#pragma mark 方法二  全局的字典存储
//NSMutableDictionary *_cache;
//
//+(void)load{
//    _cache = [NSMutableDictionary dictionaryWithCapacity:1];
//}
//
//-(void) setAge:(int)age{
//    @synchronized (self) {
//        NSString *path = [NSString stringWithFormat:@"%p",self];
//        [_cache setObject:@(age) forKey:path];
//    }
//}
//
//-(int) age{
//        NSString *path = [NSString stringWithFormat:@"%p",self];
//    return [[_cache objectForKey:path] intValue];
//}


#pragma mark 方法三  runtime 关联对象

// key的写法
// 这种写法有问题   传进去的值是 NULL  相当于0  容易和别的key 造成混淆
//const void * kAgeKey; //0x0

// 所以要设置值，并且值是唯一
//const void * kAgeKey = &kAgeKey; //0x10d856e38

// 上面的设置也有弊端 因为用extern const void * kAgeKey; 在外面
// 可以修改 kAgeKey的指向

//static const void *kAgeKey = &kAgeKey;

// 其他方法
//
//static const char kAgeKey;
//
//
//-(void) setAge:(int)age{
////    objc_setAssociatedObject(self, kAgeKey, @(age), OBJC_ASSOCIATION_ASSIGN);
//
//    objc_setAssociatedObject(self, &kAgeKey, @(age), OBJC_ASSOCIATION_ASSIGN);
//
//}
//
//-(int) age{
////    return [objc_getAssociatedObject(self, kAgeKey) intValue];
//
//        return [objc_getAssociatedObject(self, &kAgeKey) intValue];
//}


#pragma mark 方法四： @selector()
// 好处 可读性高  会有提示 

-(void) setAge:(int)age{

    objc_setAssociatedObject(self, @selector(age), @(age), OBJC_ASSOCIATION_ASSIGN);
    
}

-(int) age{

    return [objc_getAssociatedObject(self, @selector(age)) intValue];
}


/**
 移除所有关联对象
 */
-(void) removeAllAssociate{
    objc_removeAssociatedObjects(self);
}

@end
