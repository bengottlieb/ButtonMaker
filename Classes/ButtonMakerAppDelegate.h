//
//  ButtonMakerAppDelegate.h
//  ButtonMaker
//
//  Created by Dermot Daly on 22/04/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonMakerViewController;

@interface ButtonMakerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ButtonMakerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonMakerViewController *viewController;

@end

