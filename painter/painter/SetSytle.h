//
//  SetSytle.h
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BIDViewController;
@interface SetSytle : UIViewController
{
BIDViewController *viewController;
}
@property(strong,nonatomic)BIDViewController *viewController;
- (IBAction)done:(UIButton *)sender;

@end
