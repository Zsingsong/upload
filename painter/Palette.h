//
//  Palette.h
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@class BIDViewController;
@interface Palette : UIView
{
    CGPoint firstTouch;
    CGPoint lastTouch;
    UIColor *currentColor;
    float painWidth;
    ShapeType shapeType;
    UIImage *image;
    NSString *path;
    BOOL haveSave;
    CGContextRef context;
    Action ac;
    BIDViewController *viewController;
}

@property CGPoint firstTouch;
@property CGPoint lastTouch;
@property (strong,nonatomic)UIColor *currentColor;
@property float painWidth;
@property ShapeType shapeType;
@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSString *path;
@property BOOL haveSave;
@property CGContextRef context;
@property Action ac;
@property (strong,nonatomic) BIDViewController *viewController;
@end
