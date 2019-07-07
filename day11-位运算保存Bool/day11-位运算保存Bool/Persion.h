//
//  Persion.h
//  day11-位运算保存Bool
//
//  Created by luokan on 2019/7/4.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion : NSObject

-(void) setTall:(BOOL) isTall;
-(void) setRich:(BOOL) isRich;
-(void) setHandSome:(BOOL) isHandSome;

-(BOOL)tall;
-(BOOL)rich;
-(BOOL)handSome;

@end

NS_ASSUME_NONNULL_END
