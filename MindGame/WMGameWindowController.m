//
//  WMGameWindowController.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMGameWindowController.h"
#import "WMTileView.h"
#import "WMGame.h"

@interface WMGameWindowController ()

- (void)stopObservingTiles;
- (NSArray *)tileViews;

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
    self.game = [WMGame new];
}

- (IBAction)tileTapped:(id)sender
{
    NSAssert([sender isKindOfClass:[NSButton class]], @"Expected button, got something else");
    NSButton *tileButton = sender;
    NSAssert([tileButton tag] > 0, @"Button is not tagged");
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.game tapTileAtIndex:[tileButton tag] - 1];
}

- (IBAction)solveGame:(id)sender
{
    [self.game solve];
}

- (void)observeTiles
{
//    int observationOptions = NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew;
//    
//    for (WMTile *tile in [self.game tiles]) {
//        
//        [tile addObserver:self forKeyPath:@"color" options:observationOptions context:NULL];
//    }
}

- (void)stopObservingTiles
{
//    for (WMTile *tile in [self.game tiles]) {
//        [tile removeObserver:self forKeyPath:@"color"];
//    }
}

- (void)setGame:(WMGame *)game
{
    if (game == _game) return;
    
    [self stopObservingTiles];
    _game = game;
    [self observeTiles];
}

- (NSArray *)tileViews
{
    NSArray *subviews = [[self.window contentView] subviews];
    NSIndexSet *indexSet = [subviews indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isKindOfClass:[WMTileView class]];
    }];
    return [[subviews objectsAtIndexes:indexSet] sortedArrayUsingComparator:^NSComparisonResult(WMTileView *obj1, WMTileView *obj2) {
        NSUInteger index1 = obj1.tile.index;
        NSUInteger index2 = obj2.tile.index;
        
        if (index1 == index2) {
            return NSOrderedSame;
        }
        else if (index1 > index2) {
            return NSOrderedAscending;
        }
        else {
            return NSOrderedDescending;
        }
    }];
}

- (WMTileView *)tileViewWithIndex:(NSUInteger)index
{
    return [[self tileViews] objectAtIndex:index];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    if ([object isKindOfClass:[WMTile class]] && [keyPath isEqualToString:@"color"]) {
//        WMTile *tile = object;
//        NSView *view = [[self.window contentView] viewWithTag:index + 1];
//        NSAssert(view != nil && [view isKindOfClass:[NSButton class]], @"Expecting a button, got something else");
//        
//        NSLog(@"Change color of tile %lu", index);
//        NSButton *tileButton = (NSButton *)view;
//        [[tileButton cell] setBackgroundColor:[tile NSColor]];
//        [tileButton setTitle:[NSString stringWithFormat:@"%d", [tile color]]];
////        [tileButton setNeedsDisplay];
//    }
}

@end
