//
//  BPAppDelegate.h
//  Hello Mac
//
//  Created by Brian Partridge on 8/10/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BPAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextFieldCell *helloLabel;

@end
