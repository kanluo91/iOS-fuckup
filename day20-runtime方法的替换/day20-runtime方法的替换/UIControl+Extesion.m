//
//  UIControl+Extesion.m
//  day20-runtime方法的替换
//
//  Created by luokan on 2019/7/17.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "UIControl+Extesion.h"
#import <objc/message.h>
@implementation UIControl (Extesion)

+(void)load{
    
    Method m1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    
    Method m2 = class_getInstanceMethod(self, @selector(jj_sendAction:to:forEvent:));
    
    method_exchangeImplementations(m1, m2);
    
}

-(void)jj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    
    NSLog(@"交换了系统的方法:%@\nsel=%@\nevent=%@",target,NSStringFromSelector(action),event);
    
}

@end
