//
//  Persion.h
//  day19-msgSend方法调用
//
//  Created by luokan on 2019/7/16.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion : NSObject

@property (nonatomic,assign) int age;

-(void)run;

-(void) haha;

-(void)print;

@end

NS_ASSUME_NONNULL_END
