//
//  D_View.m
//  AL_事件传递与相应
//
//  Created by 李丽 on 2020/6/18.
//  Copyright © 2020 李丽. All rights reserved.
//

#import "D_View.h"

@implementation D_View

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@" ~~~~~~~ DDDDD_View hitTest ~~~~~~~ ");
    // 返回默认执行的操作 - 返回一个 合适的视图
    return [super hitTest:point withEvent:event];
    // 自定义操作 -------------------------
    // 判断 次视图 是否能接受事件
//    if (self.isUserInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
//        return nil;
//    }
//
//    // 判断 触摸点 是否在此视图上
//    if ([self pointInside:point withEvent:event] == NO) {
//        return nil;
//    }
//
//    NSInteger count = self.subviews.count;
//    for (NSInteger i = count - 1; i >= 0; i --) {
//        UIView *subView = self.subviews[i];
//
//        // 坐标系转换 - 将 此视图上的点 转化成 子视图（subView）上的点
//        CGPoint subPoint = [self convertPoint:point toView:subView];
//        // 将事件传递给 子势图，让姿势图判断 其 是否是最合适的相应着
//        UIView *fitView = [subView hitTest:subPoint withEvent:event];
//        if (fitView) {
//            // 如果是 ，返回子视图
//            return fitView;
//        }
//    }
//    // 如果没有合适的相应着，则返回自己
//    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@" -----  DDDDD_View 摸我干啥！---- ");
}

// 判断 触摸点 是否在此视图上
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x < 20 && point.y <= 50) {
        return YES;
    }

    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
