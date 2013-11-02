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
    NSString *undoPicturePath;
    CGImageRef imageRef;
    UIImage *drawImage;
    Action ac;
    BIDViewController *viewController;
    int count;
	int record;
    SEL save;
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
@property (strong,nonatomic) NSString *undoPicturePath;
@property  CGImageRef imageRef;
@property (strong,nonatomic)UIImage *drawImage;
@property Action ac;
@property (strong,nonatomic) BIDViewController *viewController;
@property int count;
@property int record;
@property SEL save;
//save current view to picture
- (void)saveCurrentViewToPicture;
@end
