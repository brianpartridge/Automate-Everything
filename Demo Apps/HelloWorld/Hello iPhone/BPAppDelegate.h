//
//  BPAppDelegate.h
//  Hello iPhone
//
//  Created by Brian Partridge on 8/10/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BPViewController;

@interface BPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BPViewController *viewController;

@end
