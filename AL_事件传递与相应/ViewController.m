//
//  ViewController.m
//  AL_事件传递与相应
//
//  Created by 李丽 on 2020/6/18.
//  Copyright © 2020 李丽. All rights reserved.
//
/** 点击事件流程
 * 1、 当 App 接收到触摸事件时，主线程的 runloop 被唤醒，触发 source1 回调，source1 回调又触发 source0 回调，将接收到的触摸事件（IOHIDEvent对象） 封装成 UIEvent 对象，此时 App将正式开始对于触摸事件的相应
 *      ⚠️： source0 回调将触摸事件添加到 UIApplication 的事件队列中
 * 2、UIApplication 会 从事件队列中取出最早的事件进行分发处理，首先将事件传递给窗口对象（UIWindiow），
 *      如果有多个 UIWindow 对象 , 则先选择最后加上的 UIWindow 对象
 * 3、UIWindow 会 调用其 hitTest：withEvent： 方法在视图层级结构中找到一个最合适的 UIView 来处理触摸事件。
 *      这个最合适的 UIView 就是事件最佳响应者
 * 4、最佳响应者 对 触摸事件拥有决定权，他可以决定自己独自相应这个事件，
 *      也可以自己相应之后再传递给其他响应者
 * 5、事件传递顺序：
 *       view（最佳响应者） -> superView ... -> UIViewController.view -> UIViewController -> UIWindow -> UIApplication -> 事件丢弃
 * 6、 hitTest：withEvent： 查找最佳响应者
 *     touchsBegan:withEvent: 等一系列函数 处理事件
 
 */

#import "ViewController.h"
#import "ALView.h"
#import "A_View.h"
#import "B_View.h"
#import "C_View.h"
#import "D_View.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // A: 红色  B: 绿色  C: 白色  D 黄色
    
    ALView *alView = [[ALView alloc] initWithFrame:CGRectMake(00, 0, self.view.bounds.size.width, 300)];
    alView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:alView];
    
    A_View *aView = [[A_View alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    aView.backgroundColor = [UIColor redColor];
    [alView addSubview:aView];

    B_View *bView = [[B_View alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    bView.backgroundColor = [UIColor greenColor];
    [alView addSubview:bView];

    C_View *cView = [[C_View alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    cView.backgroundColor = [UIColor whiteColor];
    [aView addSubview:cView];

    D_View *dView = [[D_View alloc] initWithFrame:CGRectMake(80, -20, 100, 50)];
    dView.backgroundColor = [UIColor yellowColor];
//    dView.userInteractionEnabled = false;
    [aView addSubview:dView];
}


@end
