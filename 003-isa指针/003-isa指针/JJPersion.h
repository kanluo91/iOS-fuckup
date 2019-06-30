//
//  JJPersion.h
//  003-isa指针
//
//  Created by luokan on 2019/6/30.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJPersion : NSObject<NSCoding>

-(void) persionInstanceMethod;

+(void) persionClassMethod;

+(void) test;
@end

NS_ASSUME_NONNULL_END
