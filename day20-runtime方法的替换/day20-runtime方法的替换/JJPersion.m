//
//  JJPersion.m
//  day20-runtime方法的替换
//
//  Created by luokan on 2019/7/17.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "JJPersion.h"

@implementation JJPersion

-(void) eat:(NSString *) something{
    
    NSLog(@"正在吃东西:%@\n",something);
}


-(void) speak:(NSString *)launge{
    NSLog(@"母语是:%@\n",launge);
}

@end
