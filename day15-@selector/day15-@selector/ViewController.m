//
//  ViewController.m
//  day15-@selector
//
//  Created by luokan on 2019/7/5.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"


struct method_t {
    SEL name; // 函数名字
    const char *types; // 函数的编码
    IMP imp; // 指向函数的指针
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // char * 输出用 %s
    
    SEL sel1 = @selector(test);
    SEL sel2 = sel_registerName("test");
    
    
    printf("%s\n%s\n",sel1,sel2);
    printf("%p\n%p\n",&sel1,&sel2);
// 输出  说明地址一样
//    test
//    test
//    0x7ffeed5db8e8
//    0x7ffeed5db8e0
    
    
    const char * name1 = sel_getName(sel1);
    NSString * name2 = NSStringFromSelector(sel2);
    
    NSLog(@"\n%s\n%@\n",name1,name2);
    
    char a[] = @encode(SEL);
    char b[] = @encode(id);
    char c[] = @encode(void);
    char d[] = @encode(Class);
    char e[] = @encode(float);

//    SEL==:
//    id==@
//    void==v
//    Class==#
//    float==f
    
    printf("SEL==%s\n",a);
    printf("id==%s\n",b);
    printf("void==%s\n",c);
    printf("Class==%s\n",d);
    printf("float==%s\n",e);
}


-(void) test{
    
}


@end
