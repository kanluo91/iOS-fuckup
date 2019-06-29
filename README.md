# iOS-Interview
iOS面试题详解

1. 一个NSObject 对象 占用多少内存?

> 实际占用内存的大小

`class_getInstanceSize 等价于 sizeof `
> 系统分配内存的大小

`malloc_size()`
