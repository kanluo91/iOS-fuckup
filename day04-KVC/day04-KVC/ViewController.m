//
//  ViewController.m
//  day04-KVC
//
//  Created by luokan on 2019/7/7.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"

@interface ViewController ()

@property (nonatomic,strong) Persion *p1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.p1 = [Persion new];
    
    [self.p1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self test01];
    
    [self test02];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    printf("\n--------------------\n");
    NSLog(@"KVO:%@",change);
    printf("\n--------------------\n");
    
}


-(void) test01{
    [self.p1 setValue:@"金角大王" forKey:@"name"];
    [self.p1 setValue:@(12) forKey:@"age"];
}


-(void) test02{
    
   id nameValeu =  [self.p1 valueForKey:@"name"];
    
    id ageValue = [self.p1 valueForKey:@"age"];
    
    NSLog(@"\nname = %@\nage = %@\n",nameValeu,ageValue);
    
    
}


-(void)dealloc{
    if(self.p1){
        [self.p1 removeObserver:self forKeyPath:@"name"];
    }
}

@end
