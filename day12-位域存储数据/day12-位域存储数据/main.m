//
//  main.m
//  day12-位域存储数据
//
//  Created by luokan on 2019/7/5.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persion.h"

int main(int argc, const char * argv[]) {

    Persion *p = [Persion new];
    p.tall  = YES;
    p.rich = NO;
    p.handSome = YES;
    
    printf("%d %d %d\n",p.tall,p.rich,p.handSome);
    
    
    return 0;
}
