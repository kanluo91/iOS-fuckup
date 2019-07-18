//
//  ViewController.m
//  day06-block捕获变量
//
//  Created by luokan on 2019/7/11.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 block __weak __strong
  __strong Persion * strongP = p;  会被强引用到
 __strong Persion * strongP = weakP; 强引用不到
 */
void test01(){
    
    Persion *p = [Persion new];
    __weak Persion *weakP = p;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        printf("weakP = %p\n",weakP);
        
//        __strong Persion * strongP = p;
        __strong Persion * strongP = weakP;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            printf("strongP = %p\n",strongP);
            
        });
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    test01();
    
}


@end
