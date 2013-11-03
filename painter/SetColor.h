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
@property (strong, nonatomic) IBOutlet UILabel *preview;
@property(strong,nonatomic)BIDViewController *viewController;
@property (strong, nonatomic) IBOutlet UIView *showColorView;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UITextField *redValue;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UITextField *greenValue;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UISlider *opacitySlider;
@property (strong, nonatomic) IBOutlet UITextField *blueValue;
@property (strong, nonatomic) IBOutlet UITextField *opacityValue;
- (IBAction)changeColor:(id)sender;
- (IBAction)backKeyBoard:(id)sender;
- (IBAction)done:(UIButton *)sender;
- (IBAction)reset:(id)sender;
@end
