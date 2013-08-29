//
//  BPAppDelegate.m
//  Hello Mac
//
//  Created by Brian Partridge on 8/10/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import "BPAppDelegate.h"

@implementation BPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

   [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];

}

- (void)handleURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
   NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
   NSURL *url = [NSURL URLWithString:urlString];
   self.helloLabel.stringValue = [NSString stringWithFormat:@"Hello %@!", url.host];
}

@end
