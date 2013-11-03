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
#import "Palette.h"
@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize segmentButton,colorAnimationView;
@synthesize setColorView,palette;
@synthesize paletteView;
//========================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
    paletteView=palette;
    [paletteView setViewController:self];
    palette.currentColor;
    //palette=(Palette*)paletteView;
    //[palette setViewController:self];
    
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
        {NSLog(@"clear");
            NSError *error;
            //[palette saveCurrentViewToPicture];
            NSFileManager *fileMgr = [NSFileManager defaultManager];
            NSArray *undoFileArray = [fileMgr contentsOfDirectoryAtPath:[palette undoPicturePath]
                                                                  error:&error];
            int i = 0;
                NSLog(@"count: %d",[undoFileArray count]);
            for (; i <[undoFileArray count]; i++) {
                NSLog(@"%@",[undoFileArray objectAtIndex:i]);
                NSString *content=[NSString stringWithContentsOfFile:[undoFileArray objectAtIndex:i]  encoding:NSUTF8StringEncoding error:nil];
                NSLog(@"文件读取成功: %@",content);
                [fileMgr removeItemAtPath:[[palette undoPicturePath]
                                           stringByAppendingPathComponent:[undoFileArray objectAtIndex:i]]
                                    error:&error];
            }
 
            palette.count = 0;
            NSString *tempPicture = [[NSBundle mainBundle] pathForResource:@"tempPicture" ofType:@"png"];
            NSLog(@"temp:%@",tempPicture);
            BOOL K= [fileMgr copyItemAtPath:tempPicture toPath:[palette path] error:&error];
             if (K ==YES) {
                 NSLog(@"YES");
             }
            
            
             NSArray *undoFileArray1 = [fileMgr contentsOfDirectoryAtPath:[palette undoPicturePath]
                                                                  error:&error];
             NSLog(@"jjjjjcount: %d",[undoFileArray1 count]);
            int j = 0;
            for (; j <[undoFileArray1 count]; j++) {
               
                NSLog(@"jjjj%@",[undoFileArray1 objectAtIndex:j]);
            }
             ;
           
	       [palette setAc:KNewAction];
           [palette setNeedsDisplay];
            //[[UIImage imageWithContentsOfFile:palette.path] drawInRect:[palette bounds]];
            break;
        }

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
