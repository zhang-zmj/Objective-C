### 一、RunLoop介绍：
1、什么是RunLoop？
```
通过内部维护的事件循环来对事件/消息进行管理的一个对象
```
2、什么是事件循环，怎么做到的？
```    
  * 没有消息需要处理时，休眠以避免资源占用
  * 有消息需要处理时，立刻被唤醒
```
3、RunLoop的作用：
```
//项目中的main.m文件
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
//这个可以看做如下：
int main(int argc, char * argv[]) {
    @autoreleasepool {
        int retVal = 0;
        do {
       //睡眠中等待消息
        int message = sleep_and_wait();
        //处理消息
        retval = process_message(message);
          } while (0 == retval)
    }
}
1、保持程序的持续运行
2、处理App中的各种事件（比如触摸事件、定时器事件等）
3、节省CPU资源，提高程序性能：该做事时做事，该休息时休息

```

4、RunLoop的应用：
```
1、定时器（Timer）、PerformSelector(线程间的通讯)
2、GCD Async Main Queue
3、事件响应、手势识别、界面刷新
4、网络请求
5、AutoreleasePool
6、保住程序不退出，持续运行；
7、节省 CPU 资源，提高程序性能；
```



### 二、Runloop对象：

1、iOS中有2套API来访问和使用RunLoop
  * Foundation：NSRunLoop
 * Core Foundation：CFRunLoopRef

2、NSRunLoop和CFRunLoopRef都代表着RunLoop对象
 NSRunLoop是基于CFRunLoopRef的一层OC包装 [CFRunLoopRef](https://opensource.apple.com/tarballs/CF/)开原地址
3、获取RunLoop对象
 * OC(Foundation)获取RunLoop对象
```
[NSRunLoop currentRunLoop]; // 获得当前线程的RunLoop对象
[NSRunLoop mainRunLoop]; // 获得主线程的RunLoop对象
```
* C(Core Foundation)获取RunLoop对象 
```
CFRunLoopGetCurrent(); // 获得当前线程的RunLoop对象
CFRunLoopGetMain(); // 获得主线程的RunLoop对象
```

### 三、Runloop数据结构：

1、Runloop的相关类
```
CFRunLoopRef - 获得当前RunLoop和主RunLoop
CFRunLoopModeRef - RunLoop 运行模式，只能选择一种，
                   在不同模式中做不同的操作，包含一下三种
CFRunLoopSourceRef - 事件源，输入源
CFRunLoopTimerRef - 定时器时间
CFRunLoopObserverRef - 观察者
```
2、CFRunLoop的底层结构
```
typedef struct __CFRunLoop *CFRunLoopRef;
struct __CFRunLoop {
    pthread_t    pthread;  //--对应线程(RunLoop和线程的关系)
    CFMutableSetRef  commonModes;    //NSMutableSet< NSString*>
    CFMutableSetRef  commonModeItems;  // Observer  Timer   Source    
    CFRunLoopModeRef currentMode;    //当前的model
    CFMutableSetRef  modes;          //NSMutableSet< CFRunLoopMode*>
};
```
3、CFRunLoopMode的底层结构(modes)
```
typedef struct __CFRunLoop *CFRunLoopModelRef;
struct __CFRunLoopModel {

    //名称 NSDefaultRunLoopModel
    CFStringRef    _name;   

    // 代表触摸事件、performSelector:onThread:
    CFMutableSetRef _sources0;   

    //基于Port的线程间通信、系统事件捕捉
    CFMutableSetRef _sources1;  
  
     //NSTimer、performSelector:withObject:afterDelay:
    CFMutableArrayRef _observers; 

    //用于监听RunLoop的状态、UI刷新、AutoreleasePool
    CFMutableArrayRef _timers;    //定时器

};
```

![RunLoop.png](https://upload-images.jianshu.io/upload_images/2358583-cda3c03d91709d80.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4、CFRunLoopModeRef代表RunLoop的运行模式(currentMode)
```
1、一个RunLoop包含若干个Mode，每个Mode又包含若干个Source0/Source1/Timer/Observer
2、RunLoop启动时只能选择其中一个Mode，作为currentMode
3、如果需要切换Mode，只能退出当前Loop，再重新选择一个Mode进入
4、不同组的Source0/Source1/Timer/Observer能分隔开来，互不影响
5、如果Mode里没有任何Source0/Source1/Timer/Observer，RunLoop会立马退出
```

5、常见的3种Model
```

1、kCFRunLoopDefaultMode（NSDefaultRunLoopMode）：App的默认Mode，通常主线程是在这个Mode下运行
2、UITrackingRunLoopMode：界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
3、NSRunLoopCommentMode： 
    * CommentMode不是实际存在的一种Model
    * 是同步Source/Timer/Observer到多个Model中的一种技术解决方案
4、UIInitializationRunLoopMode：在刚启动 App 时第进入的第一个 Mode，启动完成后就不 再使用
5、GSEventReceiveRunLoopMode：接受系统内部事件，通常用不到

```

6、CFRunLoopObserverRef
```
  
    // 创建Observer
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
    switch (activity) {
        case kCFRunLoopEntry:     //RunLoop 准备启动
            NSLog(@"RunLoop进入");
            break;
        case kCFRunLoopBeforeTimers:// RunLoop 将要处理一些Timer相关事件
            NSLog(@"RunLoop要处理Timers了");
            break;
        case kCFRunLoopBeforeSources: //RunLoop 将要处理一些 Source 事件
            NSLog(@"RunLoop要处理Sources了");
            break;
        case kCFRunLoopBeforeWaiting: /RunLoop 将要进行休眠状态,即将由用户态切换到内核态
            NSLog(@"RunLoop要休息了");
            break;
        case kCFRunLoopAfterWaiting: //RunLoop 被唤醒，即从内核态切换到用户态后
            NSLog(@"RunLoop醒来了");
            break;
        case kCFRunLoopExit: // RunLoop 退出
            NSLog(@"RunLoop退出了");
            break;
        default:
            break;
    }
    });
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);

```

### 四、Runloop实现机制：

![截屏2021-02-23 下午10.04.53.png](https://upload-images.jianshu.io/upload_images/2358583-01b306c70f6f0775.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
 1、通知观察者 RunLoop 即将启动。
 2、通知观察者即将要处理 Timer/source0 事件。
 3、处理 source0 事件。
 4、如果基于端口的源(Source1)准备好并处于等待状态，进入步骤 8。
 5、通知观察者线程即将进入休眠状态。 
 6、将线程置于休眠状态，由用户态切换到内核态，直到下面的任一事件发生才唤醒线程。
 7、通知观察者线程将被唤醒。 
 8、处理唤醒时收到的事件。
 9、通知观察者 RunLoop 结束
```



### 五、Runloop在实际开发中的应用：
1、解决NSTimer在滑动时停止工作的问题
2、实现常驻线程
3、监控应用卡顿 
> 不难发现NSRunLoop调用方法主要就是在kCFRunLoopBeforeSources和kCFRunLoopBeforeWaiting之间,还有kCFRunLoopAfterWaiting之后,也就是如果我们发现这两个时间内耗时太长,那么就可以判定出此时主线程卡顿


4、性能优化(UITableViewCell加载多个高清图片导致卡顿)

> 首先创建一个单例，单例中定义了几个数组，用来存要在runloop循环中执行的任务，然后为主线程的runloop添加一个CFRunLoopObserver,当主线程在NSDefaultRunLoopMode中执行完任务，即将睡眠前，执行一个单例中保存的一次图片渲染任务


#### 相关操作

[iOS任意线程调用堆栈](https://blog.csdn.net/jingcheng345413/article/details/72819231)

  [RunLoop卡顿检测地址1](https://blog.csdn.net/qq_22389025/article/details/80737130)

  [RunLoop卡顿检测地址2](https://blog.csdn.net/weixin_33739627/article/details/85929667)





### 六、Runloop与线程：
1、线程与RunLoop的关系
 ```
    * 线程是和RunLoop是一一对应的关系
    * RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
     * 线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
     * RunLoop会在线程结束时销毁
     * 主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop
```
2、怎样实现一个常驻线程?
```
  * 为当前线程开启一个RunLoop
  * 向该RunLoop中添加一个Port/Source等维持RunLoop的事件
  * 启动该RunLoop
```
3、怎样保证子线程数据回来更新UI的时候偶不打断用户的滑动操作？
```
  * 滑动的过程中UI处于UITrackingRunLoopMode下；
  * 网络请求处于子线程下进行的，请求的数据抛给主线程更新UI，提交到主线程的DefaultMode模式下；
  *  当滑动的时候处于TrackingMode下，提交到主线程DefaultMode下的任务不会被执行，当停止滑动的时候，会切换到DefaultMode，进而对提交的任务进行处理
```

4、PerformSelector:afterDelay:这个方法在子线程中是否起作用？为什么？怎么 解决？
```
  * 不起作用，其内部会创建一个Timer并添加到当前线程的RunLoop中；
  * 子线程默认没有RunLoop，也就没有Timer
  * 解决办法是可以使用GCD来实现：Dispatch_after
```









