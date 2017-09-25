//
//  Barber.h
//  Barber
//
//  Created by laizw on 2017/9/22.
//  Copyright © 2017年 laizw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HairType) {
    HairTypeDefault,    // 默认
    HairTypeFlatTop,    // 平头
    HairTypeRoundFace,  // 圆脸
};

@interface Barber : NSObject

+ (instancetype)Tony;

- (void)cut:(HairType)hairType;

@end
