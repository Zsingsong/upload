//
//  BIDViewController.m
//  painter
//
//  Created by zsingsong on 13-10-29.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import "BIDViewController.h"
#import "SetColor.h"
#import <QuartzCore/QuartzCore.h>
#import "SetSytle.h"
@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize segmentButton,colorAnimationView;
@synthesize setColorView;
//========================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
//    setColorView=[[SetColor alloc]initWithNibName:@"SetColor" bundle:nil];
//    setColorView.viewController=self;
}
//========================================================
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//========================================================
- (IBAction)changeSegment:(UISegmentedControl *)sender {
    UISegmentedControl *control=sender;
    NSInteger index=[control selectedSegmentIndex];
    switch (index) {
        case 0:
            NSLog(@"clear");
            break;

        case 1:
            NSLog(@"1");
        {
            setStyleView=[[SetSytle alloc]initWithNibName:@"SetSytle" bundle:nil];
            setStyleView.viewController=self;
            colorAnimationView.alpha=1.0f;
            CATransition *animation=[CATransition animation];
            animation.duration=0.3f;
            animation.delegate=self;
            animation.timingFunction=UIViewAnimationCurveEaseInOut;
            animation.type=kCATransitionMoveIn;
            animation.subtype=kCATransitionFromBottom;
            [[colorAnimationView layer]addAnimation:animation forKey:@"animation"];
            [self.colorAnimationView addSubview:setStyleView.view];
            sender.hidden=YES;
            break;
        }
        case 2:
        {
            setColorView=[[SetColor alloc]initWithNibName:@"SetColor" bundle:nil];
            setColorView.viewController=self;
            colorAnimationView.alpha=1.0f;
            CATransition *animation=[CATransition animation];
            animation.duration=0.3f;
            animation.delegate=self;
            animation.timingFunction=UIViewAnimationCurveEaseInOut;
            animation.type=kCATransitionMoveIn;
            animation.subtype=kCATransitionFromBottom;
            [[colorAnimationView layer]addAnimation:animation forKey:@"animation"];
            [self.colorAnimationView addSubview:setColorView.view];
            sender.hidden=YES;
            break;}
            
        case 3:
            NSLog(@"earse");
            break;
    
        case 4:
            {
                UIActionSheet *saveView=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"save paint" otherButtonTitles:nil];
                [saveView showInView:self.view];
            
                break;
            }
            
        case 5:
           {
               if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                   UIImagePickerController *picker=[[UIImagePickerController alloc]init];
                   picker.delegate=self;
                   picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                   //[self presentModalViewController:picker animated:YES];
                   //[self presentViewController: picker animated:YES completion:];
                   [self presentViewController:picker animated:YES completion:nil];
               }
               else
               {
                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error accessing photo library!"
                                                                   message:@"Device does not support\
                                         a photo library!"
                                                                  delegate:nil
                                                         cancelButtonTitle:@"Drat"
                                                         otherButtonTitles:nil];
                   [alert show];

               }
           }
       default:
            break;
    }//Swicth end
}//method end


//implement delegate methood
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)imagePic editingInfo:(NSDictionary *)editingInfo {
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	//[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
