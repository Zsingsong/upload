//
//  BIDViewController.h
//  painter
//
//  Created by zsingsong on 13-10-29.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SetColor ;
@class SetSytle ;
@class Palette  ;
@interface BIDViewController : UIViewController<UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate>
{
    SetColor *setColorView;
    SetSytle *setStyleView;
}
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentButton;
@property (strong, nonatomic) SetColor *setColorView;
@property (strong, nonatomic) SetSytle *setStyleView;
- (IBAction)changeSegment:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UIView *colorAnimationView;
//@property (strong, nonatomic) IBOutlet UIView *paletteView;
@property (strong, nonatomic) Palette *paletteView;
@property (strong, nonatomic) IBOutlet Palette *palette;

@end
