//
//  WMTileCell.m
//  MindGame
//
//  Created by Wesley Moore on 7/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMTileCell.h"
#import "WMTileButton.h"

@implementation WMTileCell

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    NSAssert([controlView isKindOfClass:[WMTileButton class]], @"Not a tile button");
    WMTileButton *tileButton = (WMTileButton *)controlView;
    
    NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRect:cellFrame];
    [[[tileButton tile] NSColor] setFill];
    [bezierPath fill];
}

@end
