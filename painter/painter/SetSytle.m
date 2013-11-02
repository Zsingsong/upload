//
//  SetSytle.m
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import "SetSytle.h"
#import <QuartzCore/QuartzCore.h>
#import "BIDViewController.h"
#import "Palette.h"
@interface SetSytle ()

@end

@implementation SetSytle
@synthesize viewController,palette,sizeSlider,sizeValue,weight;

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
    [super viewDidLoad];
    weight=2;
    sizeSlider.value=0.02;
    sizeValue.text=@"2";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (IBAction)changeShape:(UIButton *)sender {
    //[viewController.palette setShapType];
     NSLog(@"%@",viewController.palette);
    palette=viewController.palette;
    [palette setShapeType:sender.tag];
    
}

- (IBAction)sizeSliderChange:(UISlider *)sender {
    sizeValue.text=[NSString stringWithFormat:@"%d",(int)(sender.value*100)];
    weight=(int)(sender.value*100);
}


- (IBAction)backKeyBoard:(id)sender {
    [sizeValue resignFirstResponder];
    sizeSlider.value=sizeValue.text.floatValue/100;
    weight=(int)sizeValue.text.floatValue;
}
@end
