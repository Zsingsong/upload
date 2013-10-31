//
//  SetColor.h
//  painter
//
//  Created by zsingsong on 13-10-31.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BIDViewController;
@interface SetColor : UIViewController
{
    BIDViewController *viewController;
}
@property(strong,nonatomic)BIDViewController *viewController;
@property (strong, nonatomic) IBOutlet UIView *showColorView;
@property (strong, nonatomic) IBOutlet UIProgressView *redSlider;
@property (strong, nonatomic) IBOutlet UITextField *redValue;
@property (strong, nonatomic) IBOutlet UIProgressView *greenSlider;
@property (strong, nonatomic) IBOutlet UITextField *greenValue;
@property (strong, nonatomic) IBOutlet UIView *blueSlider;
@property (strong, nonatomic) IBOutlet UIProgressView *opacitySlider;
@property (strong, nonatomic) IBOutlet UITextField *blueValue;
@property (strong, nonatomic) IBOutlet UITextField *opcityValue;
- (IBAction)done:(UIButton *)sender;

@end
