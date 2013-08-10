//
//  BPAppDelegate.h
//  HelloWorld
//
//  Created by Brian Partridge on 12/8/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BPViewController;

@interface BPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BPViewController *viewController;

@end
