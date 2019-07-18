//
//  ViewController.m
//  day20-runtime方法的替换
//
//  Created by luokan on 2019/7/17.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "JJPersion.h"
#import <objc/message.h>
#import "UIControl+Extesion.h"

@interface ViewController ()

@end


/**
 替换的方法

 @param self 默认参数1  注意： 一定要加
 @param sel 默认参数2  注意： 一定要加
 @param str 参数3
 */
void test(id self,SEL sel,NSString * str){
    NSLog(@"调用了test:%@\n",str);
}


void test01(){
    
    JJPersion *p = [JJPersion new];
    
    NSLog(@"xx= %s\n",@encode(NSString));
    
    class_replaceMethod([JJPersion class], @selector(speak:), (IMP)test, "v@:#");
    
    [p speak:@"中国话"];
    
}

@implementation ViewController

-(void) test02{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame  = CGRectMake(100, 100, 50, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnAction:(UIButton *)sender{
    
    NSLog(@"点击了按钮\n");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    test01();
    
    [self test02];

}


@end
