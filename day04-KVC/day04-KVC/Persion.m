//
//  Persion.m
//  day04-KVC
//
//  Created by luokan on 2019/7/7.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "Persion.h"

@implementation Persion

-(void)setName:(NSString *)name{
    _name  =name;
    NSLog(@"KVC 调用了Setter方法");
}



/**
 KVC 是否可以直接访问成员变量

 @return return YES/NO  默认返回YES
 */
+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}

@end
