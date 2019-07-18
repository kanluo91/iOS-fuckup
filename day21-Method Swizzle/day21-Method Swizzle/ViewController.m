//
//  ViewController.m
//  day21-Method Swizzle
//
//  Created by luokan on 2019/7/18.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "JJStudent.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JJStudent *stu = [JJStudent new];
    
    [stu performSelector:@selector(makeMoney:) withObject:@"iphone"];
}


@end
