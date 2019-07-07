//
//  Persion.h
//  day3-KVO
//
//  Created by luokan on 2019/7/6.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion : NSObject
{
    @public
    int _age;
}

@property (nonatomic,assign) int age;

@end

NS_ASSUME_NONNULL_END
