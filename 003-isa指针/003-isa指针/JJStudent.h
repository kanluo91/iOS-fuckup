//
//  JJStudent.h
//  003-isa指针
//
//  Created by luokan on 2019/6/30.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "JJPersion.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJStudent : JJPersion
{
    @public
    int _weight;
    NSString *_name;
}

@property (nonatomic,assign) int height;

-(void) studentInstanceMethod;

+(void) studentClassMethod;

+(void) test;

@end

NS_ASSUME_NONNULL_END
