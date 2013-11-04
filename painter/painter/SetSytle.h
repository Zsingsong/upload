//
//  SetSytle.h
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BIDViewController;
@class Palette;
@interface SetSytle : UIViewController
{
BIDViewController *viewController;
    Palette *palette;
    NSInteger weight;
    UIButton *currentButton;
    UIButton *prevButton;
}
@property(strong,nonatomic)BIDViewController *viewController;
@property(strong,nonatomic)Palette *palette;
- (IBAction)done:(UIButton *)sender;
- (IBAction)changeShape:(UIButton *)sender;
- (IBAction)sizeSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UISlider *sizeSlider;
@property NSInteger weight;
@property (strong, nonatomic) IBOutlet UITextField *sizeValue;
@property (strong, nonatomic) UIButton *currentButton;
@property (strong, nonatomic) UIButton *prevButton;
@property (strong, nonatomic) IBOutlet UIButton *lineButton;
@property (strong, nonatomic) IBOutlet UIButton *customButton;
@property (strong, nonatomic) IBOutlet UIButton *rectButton;
@property (strong, nonatomic) IBOutlet UIButton *circleButton;
- (IBAction)backKeyBoard:(id)sender;

@end
