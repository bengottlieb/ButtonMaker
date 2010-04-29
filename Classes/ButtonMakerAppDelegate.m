//
//  ButtonMakerAppDelegate.m
//  ButtonMaker
//
//  Created by Dermot Daly on 22/04/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

#import "ButtonMakerAppDelegate.h"
#import "ButtonMakerViewController.h"

@implementation ButtonMakerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
