//
//  SetColor.m
//  painter
//
//  Created by zsingsong on 13-10-31.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import "SetColor.h"
#import <QuartzCore/QuartzCore.h>
#import "BIDViewController.h"
@interface SetColor ()

@end

@implementation SetColor
@synthesize viewController;
@synthesize redSlider,redValue,greenSlider,greenValue,blueSlider,blueValue,opacitySlider,opacityValue,preview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //================init==========================================
    [super viewDidLoad];
    preview.backgroundColor=[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:opacitySlider.value];
    redValue.text = [[NSString alloc] initWithFormat:@"%d", (int)(redSlider.value*255)];
	greenValue.text = [[NSString alloc] initWithFormat:@"%d",
                       (int)(greenSlider.value*255)];
	blueValue.text = [[NSString alloc] initWithFormat:@"%d",
                      (int)(blueSlider.value*255)];
	opacityValue.text = [[NSString alloc] initWithFormat:@"%.0f%@",
                        opacitySlider.value*100,@"%"] ;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//==================================================================
- (IBAction)changeColor:(id)sender {
    preview.backgroundColor=[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:opacitySlider.value];
    redValue.text = [[NSString alloc] initWithFormat:@"%d", (int)(redSlider.value*255)];
	greenValue.text = [[NSString alloc] initWithFormat:@"%d",
                       (int)(greenSlider.value*255)];
	blueValue.text = [[NSString alloc] initWithFormat:@"%d",
                      (int)(blueSlider.value*255)];
	opacityValue.text = [[NSString alloc] initWithFormat:@"%.0f%@",
                         opacitySlider.value*100,@"%"] ;
}
//==================================================================
- (IBAction)backKeyBoard:(id)sender {
    [redValue resignFirstResponder];
    [greenValue resignFirstResponder];
    [blueValue resignFirstResponder];
    [opacityValue resignFirstResponder];
    preview.backgroundColor=[UIColor colorWithRed:redValue.text. floatValue green:greenValue.text.floatValue blue:blueValue.text.floatValue alpha:opacityValue.text.floatValue];
    redSlider.value=redValue.text.floatValue/255;
    greenSlider.value=greenValue.text.floatValue/255;
    blueSlider.value=blueValue.text.floatValue/255;
    
}
//==================================================================
- (IBAction)done:(UIButton *)sender {

    CATransition *animation =[CATransition animation];
    animation.duration=0.2f;
    animation.delegate=self;
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    //animation.fillMode=kCAFillModeBackwards;
    animation.type=kCATransitionReveal;
    animation.subtype=kCATransitionFromTop;
    [self.view.superview.layer addAnimation:animation forKey:@"animation"];
    [self.view removeFromSuperview];
    viewController.colorAnimationView.alpha=0.0f;
    NSLog(@"%@",viewController);
    viewController.segmentButton.hidden=NO;
}

- (IBAction)reset:(id)sender {
    redSlider.value=0.0;
    greenSlider.value=0.0;
    blueSlider.value=0.0;
    opacitySlider.value=1.0;
    preview.backgroundColor=[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:opacitySlider.value];
    redValue.text = [[NSString alloc] initWithFormat:@"%d", (int)(redSlider.value*255)];
	greenValue.text = [[NSString alloc] initWithFormat:@"%d",
                       (int)(greenSlider.value*255)];
	blueValue.text = [[NSString alloc] initWithFormat:@"%d",
                      (int)(blueSlider.value*255)];
	opacityValue.text = [[NSString alloc] initWithFormat:@"%.0f%@",
                        opacitySlider.value*100,@"%"] ;

}
@end
