//
//  ViewController.m
//  day3-KVO
//
//  Created by luokan on 2019/7/6.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic,strong) Persion *p1;
@property (nonatomic,strong) Persion *p2;

@end

@implementation ViewController


//void _NSSetIntValueAndNotify(){
//
//    [self willChangeValueForKey:@"age"];
//    [super setAage:xxx];
//    [self didChangeValueForKey:@"age"];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p1 = [Persion new];
    self.p2 = [Persion new];
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew;
    
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
//    [self checkMethodList];
    
//    [self CustomNotifyKVO];
    
    [self changePersionValue];
}

#pragma 手动出发KVO
-(void) CustomNotifyKVO{
    
    [self.p1 willChangeValueForKey:@"age"];
    [self.p1 didChangeValueForKey:@"age"];
}

#pragma 直接修改成员变量会会触发KVO吗? 不会触发。 没有调用setter方法
-(void) changePersionValue{
    
    self->_p1->_age = 300;
    
}

/**
 检验方法列表
 */
-(void)checkMethodList{
    
    [self printMethodListInClass:object_getClass(self.p1)];
    
    [self printMethodListInClass:object_getClass(self.p2)];
    
}


/**
 打印类对象中的方法列表

 @param clz 类对象
 */
-(void) printMethodListInClass:(Class) clz{
    
    unsigned int count;
    Method *mList = class_copyMethodList(clz, &count);
    for (int i = 0; i<count; i++) {
        Method method = mList[i];
        const char *typeCodeing = method_getTypeEncoding(method);
        NSString *typeStr = [NSString stringWithUTF8String:typeCodeing];
        SEL sel = method_getName(method);
        NSString *str = NSStringFromSelector(sel);
        NSLog(@"\n方法名%d:%@ = %s\n",i,str,typeCodeing);
    }
    free(mList);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"\n==KVO 监听==:%@\n",object);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.p1.age = 123;
    self.p2.age = 345;
    
    
//    (lldb) po self.p1->isa
//    NSKVONotifying_Persion
//
//    (lldb) po self.p2->isa
//    Persion
}

-(void)dealloc{
    
    if(self.p1){
        [self.p1 removeObserver:self forKeyPath:@"age"];
    }
    
}


@end
