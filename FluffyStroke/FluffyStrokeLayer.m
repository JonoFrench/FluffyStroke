//
//  FluffyStrokeLayer.m
//  FluffyStroke
//
//  Created by Jonathan French on 04/06/2012.
//  Copyright Home 2012. All rights reserved.
//

// Import the interfaces
#import "FluffyStrokeLayer.h"
#import "Cell.h"
#import "cocos2d.h"
#include <math.h>
#include <stdio.h>

@implementation FluffyStrokeLayer

Cell * c;
CGFloat screenHeight;
CGFloat screenWidth;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	FluffyStrokeLayer *layer = [FluffyStrokeLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)])) {
        CGRect screenRect = [[UIScreen mainScreen]bounds];
        screenHeight = screenRect.size.height;
        screenWidth = screenRect.size.width;
        n= 5000;
        currentx=0;
        currenty=0;

        cellarray = [[NSMutableArray alloc]initWithCapacity:n];
        // enable touch input
		self.isTouchEnabled = YES;       
        Cell *c;
        
        for (int i=0; i<n; i++) {
            float a = i + [self RandomNumberBetween:0 end:M_PI/9];
            float r = ((i/(float) n) * (screenWidth/2) * (((n-i) / (float) n) * 3.5)) + [ self RandomNumberBetween:-3 end:3] +3;
            int xp = (r * cos(a)) + (screenWidth /2);
            int yp = (r * sin(a)) + (screenHeight /2);
            c = [[Cell alloc] initwithPositionX:xp andY:yp];
            [cellarray addObject:c];
        }
        
        CCLOG(@"Cells initialised");

	}
	return self;
}
                                                        
-(float)RandomNumberBetween:(int)start end:(int)end
{
    float diff = end - start;
    return (((float) rand() / RAND_MAX)*diff) + start;
}
         
-(void)draw
{
    for (int i=0; i < n; i++) {
        c = [cellarray objectAtIndex:i];
        [c sense:currentx y:currenty px:prevx py:prevy];
    }
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (long i=0; i < n; i++) {
        c = [cellarray objectAtIndex:i];
    }
    
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint currentpos = [touch locationInView:[touch view] ];
    CGPoint prevpos = [touch previousLocationInView:[touch view] ];
    CCLOG(@"Touch moved to %f %f",currentpos.x ,currentpos.y);
   
    currentx = currentpos.x;
    currenty = screenHeight-currentpos.y;
    prevx = prevpos.x;
    prevy = screenHeight-prevpos.y;
    
}



- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
//    CCLOG(@"Touch Ended");
}


- (void) dealloc
{
	[super dealloc];
}
@end
