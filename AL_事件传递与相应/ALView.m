//
//  ALView.m
//  AL_事件传递与相应
//
//  Created by 李丽 on 2020/6/18.
//  Copyright © 2020 李丽. All rights reserved.
//

#import "ALView.h"

@implementation ALView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@" ~~~~~~~ LLLLLLL_View hitTest ~~~~~~~ ");
//    return [super hitTest:point withEvent:event];
//}

//// 开始触摸时就会调用一次这个方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@" -----  LLLLLLL_View 摸我干啥！---- ");
}
//// 手指移动就会调用这个方法
//// 这个方法调用非常频繁
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"哎呀，不要拽人家！");
////    // 想让控件随着手指移动而移动,监听手指移动
////       // 获取UITouch对象
////    UITouch *touch = [touches anyObject];
////       // 获取当前点的位置
////    CGPoint curP = [touch locationInView:self];
////       // 获取上一个点的位置
////    CGPoint preP = [touch previousLocationInView:self];
////       // 获取它们x轴的偏移量,每次都是相对上一次
////    CGFloat offsetX = curP.x - preP.x;
////       // 获取y轴的偏移量
////    CGFloat offsetY = curP.y - preP.y;
////       // 修改控件的形变或者frame,center,就可以控制控件的位置
////       // 形变也是相对上一次形变(平移)
////       // CGAffineTransformMakeTranslation:会把之前形变给清空,重新开始设置形变参数
////       // make:相对于最原始的位置形变
////       // CGAffineTransform t:相对这个t的形变的基础上再去形变
////       // 如果相对哪个形变再次形变,就传入它的形变
//////    self.transform = CGAffineTransformTranslate(<#CGAffineTransform t#>, <#CGFloat tx#>, <#CGFloat ty#>)
////    NSLog(@"frame = %f", self.frame.origin.x);
////    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
////    NSLog(@"frameAfter = %f", self.frame.origin.x);
//}
//// 手指离开屏幕时就会调用一次这个方法
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"手放开还能继续玩耍！");
//}
//
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    NSLog(@"ALView - hitTest");

    // 判断 视图 是否能接受事件
    if (self.isUserInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }

    // 判断 触摸点 是否在此视图上
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }

    // 从后往前便利子空间视图
    NSInteger count = self.subviews.count;
    for (NSInteger i = count - 1; i >= 0; i --) {
        UIView *childView = self.subviews[i];

        // 坐标系转换 -- 将窗口上的点 转换成 子空间上面的点
        CGPoint childPoint = [self convertPoint:point toView:childView];

        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        if (fitView) {
            return fitView;
        }
    }

    // 如果没有找到更合适的view，也就是没有比自己更合适的view
    return self;
}
//
////- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
//        return nil;
//    }
//
//    if ([self pointInside:point withEvent:event] == NO) {
//        return  nil;
//    }
//
//    NSInteger count = self.subviews.count;
//    for (NSInteger k = count - 1; k >= 0; k --) {
//        UIView *childView = self.subviews[k];
//        // 坐标新转换 - 将此视图上的点转换成 子视图上的点
//        CGPoint childPoint = [self convertPoint:point toView:childView];
//
//        UIView *fitView = [childView hitTest:childPoint withEvent:event];
//        if (fitView) {
//            return fitView;
//        }
//    }
//    return nil;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
