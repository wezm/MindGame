//
//  WMGameWindowController.h
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WMGame;

@interface WMGameWindowController : NSWindowController

@property(nonatomic, strong) WMGame *game;

- (IBAction)newGame:(id)sender;

@end
