//
//  FluffyStrokeLayer.h
//  FluffyStroke
//
//  Created by Jonathan French on 04/06/2012.
//  Copyright Home 2012. All rights reserved.
//

#import "cocos2d.h"

@interface FluffyStrokeLayer : CCLayerColor
{
    int n; // number of cells
    int currentx,currenty;
    int prevx,prevy;
    NSMutableArray * cellarray;

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(float)RandomNumberBetween:(int)start end:(int)end;

@end
