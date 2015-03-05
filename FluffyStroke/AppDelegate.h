//
//  AppDelegate.h
//  FluffyStroke
//
//  Created by Jonathan French on 04/06/2012.
//  Copyright Home 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
