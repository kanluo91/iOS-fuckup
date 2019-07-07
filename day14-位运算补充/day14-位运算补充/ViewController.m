//
//  ViewController.m
//  day14-位运算补充
//
//  Created by luokan on 2019/7/5.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"

typedef enum {
    JJOptionOne = 1<<0,
    JJOptionTwo = 1<<1,
    JJOptionThree = 1<<2,
    JJOptionFour = 1<<3,
    JJOptionFive = 1<<4,
    
} JJOptions;

@interface ViewController ()

@property (nonatomic,strong) Persion *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.p = [Persion new];
//    self.p.name = @"金角大王";
    
//    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld;
//    [self.p addObserver:self forKeyPath:@"name" options:options context:nil];
    
    
}


//      0x0000 0001
//      0x0000 0010
//      0x0000 0100
// 总   0x0000 0111


-(void) testSetOptins:(JJOptions)options{
    
    // options 是总的值
    
    int v1 =  options & JJOptionOne;
    int v2 =  options & JJOptionTwo;
    int v3 =  options & JJOptionThree;
    int v4 =  options & JJOptionFour;
    int v5 =  options & JJOptionFive;
    
   printf("v1=%d\nv2=%d\nv3=%d\nv4=%d\nv5=%d\n",v1,v2,v3,v4,v5);
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    JJOptions options = JJOptionOne|JJOptionTwo|JJOptionThree;
    [self testSetOptins:options];
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    self.p.name = @"小旋风";
//
//}



@end
