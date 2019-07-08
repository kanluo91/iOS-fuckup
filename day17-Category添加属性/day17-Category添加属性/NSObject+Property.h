//
//  NSObject+Property.h
//  day17-Category添加属性
//
//  Created by luokan on 2019/7/8.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)
//{
//    int _age;// 分类中 不能加入实例变量
//}

@property (nonatomic,assign) int age;

/*
 *  Categoty中声明属性
 *  只会生成 getter 和 setter 方法的s声明  不会生成成员变量  和 方法实现
 *
 *  -(void) setAge:(int)age;
 *  -(int) age;
 */

//-(void) setAge:(int)age;
//
//-(int) age;


-(void) removeAllAssociate;

@end

NS_ASSUME_NONNULL_END
