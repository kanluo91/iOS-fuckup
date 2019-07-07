//
//  ViewController.m
//  day11-位运算保存Bool
//
//  Created by luokan on 2019/7/4.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"
#import <objc/message.h>
#import <malloc/malloc.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Persion *p  =[Persion new];
    
    p.tall = NO;
    p.rich = YES;
    p.handSome = NO;
    
    size_t  s1 = class_getInstanceSize([Persion class]);
    size_t  s2 = malloc_size((__bridge const void *)(p));
    
    printf("s1=%zu\ns2=%zu\n",s1,s2);
//    s1=16
//    s2=16
    
    printf("%d\n%d\n%d\n",p.tall,p.rich,p.handSome);
    
    
    
}


@end
