#### 一、Runtime的介绍：
* Objective-C是一门动态性比较强的编程语言，跟C、C++等语言有着很大的不同
* Objective-C的动态性是由Runtime API来支撑的
* Runtime API提供的接口基本都是C语言的，源码由C\C++\汇编语言编写

#### 二、isa 详解：
* 在arm64架构之前，isa就是一个普通的指针，存储着Class、Meta-Class对象的内存地址
* 从arm64架构开始，对isa进行了优化，变成了一个共用体（union）结构，还使用位域来存储更多的信息

```
union isa_t 
{
    Class cls;
    uintptr_t bits;
    struct {
        uintptr_t nonpointer        : 1;
        uintptr_t has_assoc         : 1;
        uintptr_t has_cxx_dtor      : 1;
        uintptr_t shiftcls          : 33; 
        uintptr_t magic             : 6;
        uintptr_t weakly_referenced : 1;
        uintptr_t deallocating      : 1;
        uintptr_t has_sidetable_rc  : 1;
        uintptr_t extra_rc          : 19;
};
```
* 位域
```
1、nonpointer
    0，代表普通的指针，存储着Class、Meta-Class对象的内存地址
    1，代表优化过，使用位域存储更多的信息
```
```
2、has_assoc
    是否有设置过关联对象，如果没有，释放时会更快
```
```
3、has_cxx_dtor
  是否有C++的析构函数（.cxx_destruct），如果没有，释放时会更快
```
```
4、shiftcls
  存储着Class、Meta-Class对象的内存地址信息
```
```
5、magic
  用于在调试时分辨对象是否未完成初始化
```
```
6、weakly_referenced
  是否有被弱引用指向过，如果没有，释放时会更快
```
```
7、deallocating
  对象是否正在释放
```
```
8、extra_rc
  里面存储的值是引用计数器减1
```
```
9、has_sidetable_rc
  1、引用计数器是否过大无法存储在isa中
  2、如果为1，那么引用计数会存储在一个叫SideTable的类的属性中
```

#### 三、objc_msgSend(消息发送)执行流程
1、消息发送 (其实也就是isa与superclass寻找方法(对象方法或类方法)
<img style="" src="./img/1、消息发送.png"/>
```
  1、如果是从 class_rw_t 中查找方法： 已经排序的二分查找，没有排序的遍历查找
  2、receiver通过isa指针找到receiverClass
  3、receiverClass通过superclass指针找到superClass
```
2、动态方法解析
<img style="" src="./img/2、动态方法解析.png"/>

* 可以实现以下方法，来动态添加方法实现
  + (BOOL)resolveInstanceMethod:(SEL)sel; (对象方法的动态添加)
```
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
   if (sel == @selector(test)) {
       // 获取其他方法
       Method method = class_getInstanceMethod(self, @selector(other));

       // 动态添加test方法的实现
       class_addMethod(self, sel,
                       method_getImplementation(method),
                       method_getTypeEncoding(method));
       // 返回YES代表有动态添加方法
       return YES;
    }
  return [super resolveInstanceMethod:sel];
}

-(void)other{

   NSLog(@"%s",__func__);
}
```

  + (BOOL)resolveClassMethod:(SEL)sel;  (类方法的动态添加)
```
+ (BOOL)resolveClassMethod:(SEL)sel
{
   if (sel == @selector(classTest)) {
      // 第一个参数是object_getClass(self)
      //class_addMethod(object_getClass(self), sel, (IMP)c_other, "v16@0:8");
      // 获取其他方法
      Method method = class_getClassMethod(self, @selector(classOther));
      // 动态添加test方法的实现
      class_addMethod(object_getClass(self), sel,
               method_getImplementation(method),
               method_getTypeEncoding(method));

      // 返回YES代表有动态添加方法
      return YES;
    }
  return [super resolveClassMethod:sel];
}

#pragma mark 类方法的转换（类方法classTest找不到就转换classOther方法）
+(void)classOther{

   NSLog(@"类方法classTest找不到就转换classOther方法");
}
```

3、消息转发
<img style="" src="./img/3、消息转发.png"/>

* 3.1、当动态解析过都找不到一个方法时候就会走消息转发，首先会调用forwardingTargetForSelector(前面可能是 +(void)或者-(void)),如果不返回nil就会走 返回类的 Selector，如果返回nil就走 3.2
```
-(id)forwardingTargetForSelector:(SEL)aSelector{

     if (aSelector == @selector(test)) {

          //return [[People alloc]init];
          return nil;
     }
   return [super forwardingTargetForSelector:aSelector];
}
```

* 3.2、当forwardingTargetForSelector返回nil或者不写这个方法时候，就会调用下面的方法
```
#pragma mark 2
/**
  方法签名：返回值类型、参数类型
*/
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(test)) {

      // 获取其他方法(一)，会走 #pragma mark 3
      /*
         Method method = class_getInstanceMethod([People class], @selector(test));
         return [NSMethodSignature signatureWithObjCTypes:method_getTypeEncoding(method)];
       */

      // 下面这一句和上面2句一个意思(二) 会走 #pragma mark 3
      return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];

      /**
         如果返回nil 就不会再走会走 #pragma mark 3 方法了，会报错返回(doesNotRecognizeSelector)
         -[NSObject(NSObject) doesNotRecognizeSelector:] + 132
       */
      // return nil;
     }
  return [super methodSignatureForSelector:aSelector];
}

#pragma mark 3.上面的方法不返回nil才会走
/**
   NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
   anInvocation.target 方法调用者
   anInvocation.selector 方法名
   [anInvocation getArgument:NULL atIndex:0]
*/
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
   //    anInvocation.target = [[MJCat alloc] init];
   //    [anInvocation invoke];

   [anInvocation invokeWithTarget:[[People alloc] init]];
 }
```

* 当上面的 #pragma mark 2 返回nil的时候，就不会走#pragma mark 3，且报错 doesNotRecognizeSelector

注意：
生成NSMethodSignature
<img style="" src="./img/4、生成NSMethodSignature.png"/>

#### 四、Runtime的常见API
1、类常用的API
```
1、 动态创建一个类（参数：父类，类名，额外的内存空间）
  Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)

2、注册一个类（要在类注册之前添加成员变量）
  void objc_registerClassPair(Class cls) 

3、销毁一个类
  void objc_disposeClassPair(Class cls)

4、获取isa指向的Class
  Class object_getClass(id obj)

5、设置isa指向的Class
  Class object_setClass(id obj, Class cls)

6、判断一个OC对象是否为Class
  BOOL object_isClass(id obj)

7、判断一个Class是否为元类
  BOOL class_isMetaClass(Class cls)

8、 获取父类
  Class class_getSuperclass(Class cls)
```

2、成员变量的API
```
1、获取一个实例变量信息
  Ivar class_getInstanceVariable(Class cls, const char *name)

2、拷贝实例变量列表（最后需要调用free释放）
  Ivar *class_copyIvarList(Class cls, unsigned int *outCount)

3、设置和获取成员变量的值
  void object_setIvar(id obj, Ivar ivar, id value)
  id object_getIvar(id obj, Ivar ivar)

4、动态添加成员变量（已经注册的类是不能动态添加成员变量的）
  BOOL class_addIvar(Class cls, const char * name, size_t size, uint8_t alignment, const char * types)

5、获取成员变量的相关信息
  const char *ivar_getName(Ivar v)
  const char *ivar_getTypeEncoding(Ivar v)
```

3、属性的API
```
1、获取一个属性
  objc_property_t class_getProperty(Class cls, const char *name)

2、拷贝属性列表（最后需要调用free释放）
  objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)

3、动态添加属性
  BOOL class_addProperty(Class cls, const char *name, const objc_property_attribute_t *attributes,
                  unsigned int attributeCount)

4、动态替换属性
  void class_replaceProperty(Class cls, const char *name, const objc_property_attribute_t *attributes,
  unsigned int attributeCount)

5、获取属性的一些信息
  const char *property_getName(objc_property_t property)

```

4、方法的API
```
1、获得一个实例方法、类方法
  Method class_getInstanceMethod(Class cls, SEL name)
  Method class_getClassMethod(Class cls, SEL name)

2、方法实现相关操作
  IMP class_getMethodImplementation(Class cls, SEL name) 
  IMP method_setImplementation(Method m, IMP imp)
  void method_exchangeImplementations(Method m1, Method m2) 

3、拷贝方法列表（最后需要调用free释放）
  Method *class_copyMethodList(Class cls, unsigned int *outCount)

4、动态添加方法
  BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)

5、动态替换方法
  IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)

6、获取方法的相关信息（带有copy的需要调用free去释放）
  SEL method_getName(Method m)
  IMP method_getImplementation(Method m)
  const char *method_getTypeEncoding(Method m)
  unsigned int method_getNumberOfArguments(Method m)
  char *method_copyReturnType(Method m)
  char *method_copyArgumentType(Method m, unsigned int index)

7、选择器相关
  const char *sel_getName(SEL sel)
  SEL sel_registerName(const char *str)

8、用block作为方法实现
  IMP imp_implementationWithBlock(id block)
  id imp_getBlock(IMP anImp)
  BOOL imp_removeBlock(IMP anImp)
```















#### 八、常见面试题

1、说出下面的打印
    题目内容: People 和Student两个类，Student继承于People，People继承于NSObject

```

#import "Student.h"
@implementation Student

-(void)printContent{

    NSLog(@"[self class] = %@",[self class]);
    NSLog(@"[self superclass] = %@",[self superclass]);

    NSLog(@"[super class] = %@",[super class]);
    NSLog(@"[super superclass] = %@",[super superclass]);

}
@end

打印结果为：
[self class] = Student
[self superclass] = People
[super class] = Student
[super superclass] = People

```
解释：
  * [self class] 是打印类，很明显是 Student;
  * [self superclass] 是通过superclass查找父类，Student继承于People，所以打印时People
  * [super class] 其实相比[self class]在本质上它们的 receiver 都是 self,所以在打印上都是 Student
  * [super superclass] 其实相比[self superclass]在本质上它们的 receiver 都是 self,所以在打印上都是 People
  *
  *

2、说出下面的打印










