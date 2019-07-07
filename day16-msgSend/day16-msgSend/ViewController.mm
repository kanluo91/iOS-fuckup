//
//  ViewController.m
//  day16-msgSend
//
//  Created by luokan on 2019/7/6.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface JJPersion:NSObject

-(void) persionTest;

@end

@implementation JJPersion

-(void) persionTest{
    NSLog(@"调用了:%s\n",__func__);
}

@end


@interface ViewController ()

@property (nonatomic,strong) JJPersion *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.p = [JJPersion new];
    [self.p persionTest];
    
    
}


@end
