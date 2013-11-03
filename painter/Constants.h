//
//  Constants.h
//  painter
//
//  Created by zsingsong on 13-11-1.
//  Copyright (c) 2013年 singsong. All rights reserved.
//

#ifndef painter_Constants_h
#define painter_Constants_h

//shape
typedef enum {
	KLineShape=0,
	KCurveShape,
	KRectShape,
	KEllipseShape,
	KImageShape,
	KMoreShape
}ShapeType;
//color
typedef enum {
	KRedColor=0,
	KGreenColor,
	KBlueColor,
	KRandomColor
}ColorIndex;

//action
typedef enum {
	KprepareAction,
	KPainAction,
	KNewAction,
	KUndoAction,
	KRedoAction
}Action;
#endif
