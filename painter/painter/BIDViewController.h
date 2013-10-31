//
//  BIDViewController.h
//  painter
//
//  Created by zsingsong on 13-10-29.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SetColor ;
@interface BIDViewController : UIViewController
{
    SetColor *setColorView;
}
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentButton;
@property (strong, nonatomic) SetColor *setColorView;
- (IBAction)changeSegment:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UIView *colorAnimationView;

@end
