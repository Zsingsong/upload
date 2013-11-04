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
@synthesize viewController,palette,sizeSlider,sizeValue,weight,currentButton,prevButton;
@synthesize lineButton,circleButton,customButton,rectButton;

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
    if (viewController.currentWeight==0) {
        weight=2;
       viewController.tempShapButton=lineButton;
    }
    else
    {
        weight=viewController.currentWeight;
        switch (viewController.tempShapButton.tag) {
            case 0:
                viewController.tempShapButton=lineButton;
                break;
            case 1:
                viewController.tempShapButton=customButton;break;
            case 2:
                viewController.tempShapButton=rectButton;break;
            case 3:
                viewController.tempShapButton=customButton;
                break;
            default:
                break;
        }

    }
    sizeValue.text=[NSString stringWithFormat:@"%d",weight];
    sizeSlider.value=weight/100.0;
    NSLog(@"tag: %@",viewController.tempShapButton);
    viewController.tempShapButton.selected=YES;

    viewController.tempShapButton.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
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
    //[palette setPainWidth:weight];
   // viewController.currentWeight=weight;
    viewController.penButtonItem.enabled=YES;
}

- (IBAction)changeShape:(UIButton *)sender {
    viewController.tempShapButton.selected=NO;
    viewController.tempShapButton.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
       viewController.tempShapButton=sender;
        
     NSLog(@"%@",viewController.palette);
    palette=viewController.palette;
    [palette setShapeType:sender.tag];
     sender.selected=YES;
     sender.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }

- (IBAction)sizeSliderChange:(UISlider *)sender {
    sizeValue.text=[NSString stringWithFormat:@"%d",(int)(sender.value*100)];
    weight=(int)(sender.value*100);
    viewController.currentWeight=weight;
}


- (IBAction)backKeyBoard:(id)sender {
    [sizeValue resignFirstResponder];
    sizeSlider.value=(sizeValue.text.floatValue)/100;
    weight=(int)(sizeValue.text.floatValue);
    viewController.currentWeight=weight;
}
@end
