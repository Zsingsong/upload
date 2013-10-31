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
@interface SetSytle ()

@end

@implementation SetSytle
@synthesize viewController;

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
@end
