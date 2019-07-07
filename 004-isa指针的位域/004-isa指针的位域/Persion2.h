//
//  Persion2.h
//  004-isa指针的位域
//
//  Created by luokan on 2019/7/1.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion2 : NSObject
{

    char _valueStore;
    
}

-(BOOL)tall;

-(void)setTall:(BOOL) isTall;

-(BOOL)rich;

-(void)setRich:(BOOL) isRich;

-(BOOL)handsome;

-(void)setHandSome:(BOOL) isHandSome;

@end

NS_ASSUME_NONNULL_END
