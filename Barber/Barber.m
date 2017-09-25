//
//  Barber.m
//  Barber
//
//  Created by laizw on 2017/9/22.
//  Copyright © 2017年 laizw. All rights reserved.
//

#import "Barber.h"

#define IPHONE_X ([UIScreen mainScreen].bounds.size.width == 375.f && [UIScreen mainScreen].bounds.size.height == 812.f)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

static CGFloat const kStatusBarHeight = 32;

@interface Barber ()
@property (nonatomic, strong) UIWindow *hair;
@property (nonatomic, strong) CAShapeLayer *roundFace;
@property (nonatomic, assign) HairType hairType;
@end

@implementation Barber

+ (instancetype)Tony {
    static Barber *tony;
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        tony = [[Barber alloc] init];
    });
    return tony;
}

- (void)cut:(HairType)hairType {
    if (IPHONE_X) {
        switch (hairType) {
            case HairTypeDefault:
                if (![self.hair isHidden]) {
                    self.hair.hidden = YES;
                }
                [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
                break;
            case HairTypeFlatTop:
                if (self.roundFace.superlayer) [self.roundFace removeFromSuperlayer];
                [self showNewHair];
                break;
            case HairTypeRoundFace:
                [self.hair.layer addSublayer:self.roundFace];
                [self showNewHair];
                break;
            default:
                break;
        }
        self.hairType = hairType;
    }
}

- (void)showNewHair {
    if (IPHONE_X) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        self.hair.hidden = NO;
        [self.hair makeKeyAndVisible];
        [window makeKeyAndVisible];
    }
}

#pragma mark - Getter
- (CAShapeLayer *)roundFace {
    if (!_roundFace) {
        CGFloat radius = 44;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, kStatusBarHeight)];
        
        UIBezierPath *left = [[UIBezierPath alloc] init];
        [left moveToPoint:CGPointMake(0, radius + kStatusBarHeight)];
        [left addLineToPoint:CGPointMake(0, kStatusBarHeight)];
        [left addLineToPoint:CGPointMake(radius, kStatusBarHeight)];
        [left addQuadCurveToPoint:CGPointMake(0, radius + kStatusBarHeight) controlPoint:CGPointMake(0, kStatusBarHeight)];
        [path appendPath:left];
        
        UIBezierPath *right = [[UIBezierPath alloc] init];
        [right moveToPoint:CGPointMake(kScreenWidth, radius + kStatusBarHeight)];
        [right addLineToPoint:CGPointMake(kScreenWidth, kStatusBarHeight)];
        [right addLineToPoint:CGPointMake(kScreenWidth - radius, kStatusBarHeight)];
        [right addQuadCurveToPoint:CGPointMake(kScreenWidth, radius + kStatusBarHeight) controlPoint:CGPointMake(kScreenWidth, kStatusBarHeight)];
        [path appendPath:right];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        _roundFace = layer;
    }
    return _roundFace;
}

- (UIWindow *)hair {
    if (!_hair) {
        _hair = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusBarHeight)];
        _hair.windowLevel = UIWindowLevelStatusBar - 1;
        _hair.backgroundColor = [UIColor blackColor];
        _hair.clipsToBounds = NO;
        
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor clearColor];
        _hair.rootViewController = vc;
    }
    return _hair;
}

@end
