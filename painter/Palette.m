//
//  Palette.m
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#import "Palette.h"
#import "BIDViewController.h"
@implementation Palette
@synthesize firstTouch,lastTouch,currentColor,painWidth,image,path,haveSave,context,ac,shapeType,viewController;

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ( (self = [super initWithCoder:aDecoder]) ) {
		//颜色的使用
		self.currentColor = [UIColor blackColor];
		self.painWidth = 2.0f;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect
{
    context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.painWidth);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    CGContextSetFillColorWithColor(context, currentColor.CGColor);
    CGRect currentRect = CGRectMake(
								    (firstTouch.x > lastTouch.x)?lastTouch.x : firstTouch.x,
								    (firstTouch.y > lastTouch.y)?lastTouch.y : firstTouch.y,
								    fabsf(firstTouch.x - lastTouch.x),
								    fabsf(firstTouch.y - lastTouch.y));

    switch (shapeType) {
        case KLineShape:
        case KCurveShape:
            CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
			CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
            CGContextStrokePath(context);
            break;
        case KRectShape:
			CGContextAddRect(context, currentRect);
			CGContextStrokeRect(context, currentRect);
//			if (KPathDrawMode == kCGPathFill)
//				CGContextFillRect(context, currentRect);
			break;
		case KEllipseShape:
			CGContextAddEllipseInRect(context, currentRect);
			CGContextStrokeEllipseInRect(context, currentRect);
//			if (KPathDrawMode == kCGPathFill)
//				CGContextFillEllipseInRect(context, currentRect);
            
			break;
        default:
            break;
    }
    
}

//处理四个触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	UITouch *touch = [[touches allObjects] objectAtIndex:0];
	ac = KPainAction;
	firstTouch = [touch locationInView:self];
	lastTouch = [touch locationInView:self];
	haveSave = NO;
	//[self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[touches allObjects] objectAtIndex:0];
	haveSave = NO;
	if (shapeType == KCurveShape) {
		firstTouch = [touch previousLocationInView:self];
		haveSave = YES;
	}
	
	lastTouch = [touch locationInView:self];
	
	[self setNeedsDisplay];
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[touches allObjects] objectAtIndex:0];
	lastTouch = [touch locationInView:self];
	haveSave = YES;
	//[self.viewController performSelector:@selector(checkUndoAndHideIfNeeded)];
    //重绘画布
	[self setNeedsDisplay];}
@end
