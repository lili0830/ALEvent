//
//  A_View.m
//  AL_事件传递与相应
//
//  Created by 李丽 on 2020/6/18.
//  Copyright © 2020 李丽. All rights reserved.
//

#import "A_View.h"

@implementation A_View

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@" ~~~~~~~ AAAAAA_View hitTest ~~~~~~~ ");
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"point");
    if (point.y > 0 && point.x < 180 && point.y < 100) {
        return true;
    }
    return false;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@" -----  AAAAAA_View 摸我干啥！---- ");
//    [super touchesBegan:touches withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
