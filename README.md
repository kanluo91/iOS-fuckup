# iOS-Interview
iOS面试题详解

1. 一个NSObject 对象 占用多少内存?

> 实际占用内存的大小

`class_getInstanceSize 等价于 sizeof `
> 系统分配内存的大小

`malloc_size()`

2.  对象的isa指针指向哪里？
isa 指针 其实是一个结构体指针
+ 实例对象的`isa`指向 **类对象**
+ 类对象的`isa `指向 **元类对象**
+ 元类对象的`isa`指向 **基类的元类对象**
+ 基类对象的`isa`指向 自己

3. oc的类信息存放在哪里？
首先OC 的类 分为
+ 实例对象（isa指针，其他变量的值）
+ 类对象（isa,superclass,property,ivar,protocol,instanceMethod ...）
+ 元类对象(isa,superclass,classMethod...)
