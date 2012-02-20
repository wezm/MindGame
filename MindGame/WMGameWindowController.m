//
//  WMGameWindowController.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMGameWindowController.h"
#import "WMGame.h"
#import "WMTileButton.h"

@interface WMGameWindowController ()

- (void)stopObservingTiles;
//- (NSArray *)tileViews;

@end

@implementation WMGameWindowController

@synthesize game=_game;

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self newGame:self];
}

- (void)dealloc
{
    [self stopObservingTiles];
}

- (IBAction)newGame:(id)sender
{
    WMGame *game = [WMGame new];
    
    /*
     B W W
     W W W
     R W W
    */
    
    WMTileColor state[9] = {
        WMTileBlueColor,
        WMTileWhiteColor,
        WMTileWhiteColor,
        WMTileWhiteColor,
        WMTileWhiteColor,
        WMTileWhiteColor,
        WMTileRedColor,
        WMTileWhiteColor,
        WMTileWhiteColor
    };
    
    [game setState:state];
    for (int i = 1; i <= 9; i++) {
        WMTileButton *tileButton = [[self.window contentView] viewWithTag:i];
        tileButton.tile = [[game tiles] objectAtIndex:i - 1];
    }
    self.game = game;
}

- (IBAction)tileTapped:(id)sender
{
    NSAssert([sender isKindOfClass:[NSButton class]], @"Expected button, got something else");
    NSButton *tileButton = sender;
    NSAssert([tileButton tag] > 0, @"Button is not tagged");
    
    //NSLog(@"%@ %d", NSStringFromSelector(_cmd), (int)[tileButton tag]);
    [self.game tapTileAtIndex:[tileButton tag] - 1];
}

- (IBAction)solveGame:(id)sender
{
    [self.game solve];
}

@end
