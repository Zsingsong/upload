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
@interface BIDViewController : UIViewController<UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
{
    SetColor *setColorView;
    SetSytle *setStyleView;
    NSInteger currentWeight;
    UIButton *tempShapButton;
    UIColor *currentColor;
    BOOL colorFlag;
}
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentButton;
@property (strong, nonatomic) SetColor *setColorView;
@property (strong, nonatomic) SetSytle *setStyleView;
@property (strong, nonatomic)  UIColor *currentColor;
- (IBAction)changeSegment:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UIView *colorAnimationView;
//@property (strong, nonatomic) IBOutlet UIView *paletteView;
@property (strong, nonatomic) Palette *paletteView;
@property (strong, nonatomic) IBOutlet Palette *palette;
@property (strong, nonatomic) UIButton *tempShapButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *penButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *trashButtonItem;
@property NSInteger currentWeight;
@property BOOL colorFlag;
- (IBAction)colorButton:(id)sender;
- (IBAction)penButton:(id)sender;
- (IBAction)trashButton:(id)sender;
- (IBAction)saveButton:(id)sender;
- (IBAction)cameraButton:(id)sender;
@end
