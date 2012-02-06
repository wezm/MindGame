//
//  WMAppDelegate.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMAppDelegate.h"
#import "WMGameWindowController.h"

@implementation WMAppDelegate

@synthesize windowController=_windowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    WMGameWindowController *windowController = [[WMGameWindowController alloc] initWithWindowNibName:@"MainWindow"];
//    self.window = windowController.window;
    [windowController showWindow:self];
    self.windowController = windowController;
}

@end
