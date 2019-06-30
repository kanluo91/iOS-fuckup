//
//  main.m
//  004-字节对齐
//
//  Created by luokan on 2019/6/30.
//  Copyright © 2019 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Student {
    char arr[10]; // 0开始 9结束
    int age; // 12开始  16结束
    double a; //16开始  24结束
    char b; //24开始  25结束
    char c; // 25开始  26结束
}; // 32

struct Student1 {
    char arr[3]; //0 开始  1 结束
    int age; // 4开始  8结束
    double a; //8开始  16结束
    char b; //16开始   17结束
    char c; //17开始   18结束
}; //24

struct Student2 {
    char arr[3]; //0 开始  1 结束
    int age; // 4开始  8结束
    double a; //8开始  16结束
    char b; //16开始   17结束
    char c; //17开始   18结束
    struct Student st;// 24开始 56结束
}; //56
int main(int argc, const char * argv[]) {

    size_t s1 = sizeof(struct Student);
    
    size_t s2 = sizeof(struct Student1);
    
    size_t s3 = sizeof(struct Student2);
    
    return 0;
}
