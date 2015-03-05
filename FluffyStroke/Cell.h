//
//  Cell.h
//  FluffyStroke
//
//  Created by Jonathan French on 04/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Cell : NSObject
{
    int _x,_y;
    int previousX;
    int previousY;
    float s; // spin velocity
    float c; // current angle
    float bd;
    float sp;
    float sl;
    CGPoint pos;
    float d ;
    int toX;
    int toY;
}
-(id)initwithPositionX:(int)x andY:(int)y;

-(float)det:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2  x3:(int)x3 y3:(int)y3;
-(float)distance:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2;
-(void)sense:(int)x y:(int)y px:(int)px py:(int)py;
-(void)setAngle: (float) a;
-(void)setPos:(int)x y:(int)y;



@end
