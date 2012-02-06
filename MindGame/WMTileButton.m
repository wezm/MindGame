//
//  WMTileButton.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMTileButton.h"
#import "WMTileCell.h"

@implementation WMTileButton

@synthesize tile=_tile;

+ (Class)cellClass
{
    return [WMTileCell class];
}

- (void)dealloc
{
    [self.tile removeObserver:self forKeyPath:@"color"];
}

//- (void)drawRect:(NSRect)dirtyRect
//{
//    // Drawing code here.
//    NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];
//    [[self.tile NSColor] setFill];
//    [path fill];
//}
//
- (void)setTile:(WMTile *)tile
{
    if (tile == _tile) return;
    
    [_tile removeObserver:self forKeyPath:@"color"];
    _tile = tile;
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionInitial;
    [tile addObserver:self forKeyPath:@"color" options:options context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[WMTile class]] && [keyPath isEqualToString:@"color"]) {
        [self setNeedsDisplay];
    }
}


@end
