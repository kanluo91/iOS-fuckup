//
//  main.m
//  day18-自己实现option传多个值
//
//  Created by luokan on 2019/7/16.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    JJOptionsOne = 1<<0,
    JJOptionsTwo = 1<<1,
    JJOptionsThree = 1<<2,
    JJOptionsFour = 1<<3,
} JJOptions;


void passOptions(JJOptions options){
    
    int value1 = options & JJOptionsOne;
    int value2 = options & JJOptionsTwo;
    int value3 = options & JJOptionsThree;
    int value4 = options & JJOptionsFour;
    
    printf("value1 = %d\n",value1);
    printf("value2 = %d\n",value2);
    printf("value3 = %d\n",value3);
    printf("value4 = %d\n",value4);
    
    if(options&JJOptionsOne){
        printf("包含：JJOptionsOne\n");
    }else{
        printf("不包含：JJOptionsOne\n");
    }
    
    if(options&JJOptionsTwo){
        printf("包含：JJOptionsTwo\n");
    }else{
        printf("不包含：JJOptionsTwo\n");
    }
    
    if(options&JJOptionsThree){
        printf("包含：JJOptionsThree\n");
    }else{
        printf("不包含：JJOptionsThree\n");
    }
    
    if(options&JJOptionsFour){
        printf("包含：JJOptionsFour\n");
    }else{
        printf("不包含：JJOptionsFour\n");
    }
}

int main(int argc, const char * argv[]) {
    
    
//    JJOptions opts = JJOptionsOne|JJOptionsTwo|JJOptionsThree;
    
        JJOptions opts = JJOptionsOne+JJOptionsTwo+JJOptionsThree;
    passOptions(opts);

    return 0;
}
