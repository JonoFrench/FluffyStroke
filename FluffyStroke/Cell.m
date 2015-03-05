//
//  Cell.m
//  FluffyStroke
//
//  Created by Jonathan French on 04/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "Cell.h"
#import "cocos2d.h"

@implementation Cell


-(void)setAngle: (float) a
{
    c = a;
}

-(void)setPos:(int)x y:(int) y
{

    //_x = x;
    //_y = y;
}

-(id)initwithPositionX:(int)x andY:(int) y
{
    self = [super init];
    if(self)
    {        
        _x = x;
        _y = y;
        pos.x = x;
        pos.y = y;
        previousX=0;
        previousY=0;
        s=0;
        c=0;
        bd = 37;
        sp = 0.004;
        sl = .97;
        //sl = .95;
        d = bd * s + .001;
        toX = _x + d * cos(c);
        toY = _y + d * sin(c);
        //glEnable(GL_LINE_SMOOTH);
    }
    return self;
}

-(void)sense:(int)x y:(int)y px:(int)px py:(int)py
{
    if(previousX !=x || previousY !=y)
    {
        s += sp * [self det:_x y1:_y x2:previousX y2:previousY x3:x y3:y] / ([self distance:_x y1:_y x2:x y2:y]+1) ;
        previousX = x;
        previousY = y;
    }
    s = s * sl;
    c +=s;
    d = bd * s + 1;
    toX = _x + d * cos(c);
    toY = _y + d * sin(c);
    //glColor4f(d/1000, 1.0, 0.76, 1.0);
    glColor4ub(255-(s*10),255-( d*cos(c)),255-( d*sin(c)), 255);
    ccDrawLine(pos, CGPointMake(toX,toY ));
   // CCLOG(@"Drawing %f ",d);
}

-(float)det:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2  x3:(int)x3 y3:(int)y3
{
    return (float) ((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
}

-(float)distance:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2
{
    return sqrtf((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
}


@end
