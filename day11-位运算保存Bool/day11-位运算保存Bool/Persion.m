//
//  Persion.m
//  day11-位运算保存Bool
//
//  Created by luokan on 2019/7/4.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "Persion.h"

#define kTallMask (1<<0)
#define kRichMask (1<<1)
#define KHandSomeMask (1<<2)

@interface Persion()
{

    union{
        char bits; // 占一个字节
        // 增加代码的可读性   占一个字节
        struct {
            char tall : 1;
            char rich : 1;
            char handSome : 1;
        };
    } _valueContainer;
}

@end

@implementation Persion

-(void) setTall:(BOOL) isTall{
    if(isTall){
        _valueContainer.bits = _valueContainer.bits | kTallMask;
    }else{
        _valueContainer.bits = _valueContainer.bits & ~kTallMask;
    }
}

-(void) setRich:(BOOL) isRich{
    if(isRich){
        _valueContainer.bits |= kRichMask;
    }else{
        _valueContainer.bits &= ~kRichMask;
    }
}

-(void) setHandSome:(BOOL) isHandSome{
    if(isHandSome){
        _valueContainer.bits |= KHandSomeMask;
    }else{
        _valueContainer.bits &= ~KHandSomeMask;
    }
}

-(BOOL)tall{
    return !!(_valueContainer.bits & kTallMask);
}

-(BOOL) rich{
    return !!(_valueContainer.bits & kRichMask);
}

-(BOOL) handSome{
    return !!(_valueContainer.bits & KHandSomeMask);
}

@end
