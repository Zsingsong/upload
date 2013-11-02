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
    NSInteger currentWeight;
    BOOL flag;
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
@property NSInteger currentWeight;
@property BOOL flag;
- (IBAction)backKeyBoard:(id)sender;

@end
