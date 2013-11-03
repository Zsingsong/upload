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
@synthesize setColorView,palette,setStyleView;
@synthesize paletteView;
@synthesize currentWeight,tempShapButton;
//========================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
    currentWeight=-1;
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
- (IBAction)colorButton:(id)sender {
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
}

- (IBAction)penButton:(id)sender {
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
}

- (IBAction)trashButton:(id)sender {
    NSError *error;
    //[palette saveCurrentViewToPicture];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *undoFileArray = [fileMgr contentsOfDirectoryAtPath:[palette undoPicturePath]
                                                          error:&error];
    int i = 0;
    for (; i <[undoFileArray count]; i++) {
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
    [palette setAc:KNewAction];
    [palette setNeedsDisplay];
}

- (IBAction)saveButton:(id)sender {
    UIActionSheet *saveView=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"save paint" otherButtonTitles:nil];
    [saveView showInView:self.view];
}

- (IBAction)cameraButton:(id)sender {
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
//===============================================


//implement delegate methood
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)imagePic editingInfo:(NSDictionary *)editingInfo {
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	//[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
