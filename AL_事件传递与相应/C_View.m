//
//  C_View.m
//  AL_事件传递与相应
//
//  Created by 李丽 on 2020/6/18.
//  Copyright © 2020 李丽. All rights reserved.
//

#import "C_View.h"

@implementation C_View

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@" ~~~~~~~ CCCCC_View hitTest ~~~~~~~ ");
    return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@" -----  CCCCC_View 摸我干啥！---- ");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
