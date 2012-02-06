//
//  WMTile.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMTile.h"

//static NSUInteger tileCount = 3;

@implementation WMTile

@synthesize color=_color;

- (void)tap
{
    self.color = (self.color + 1) % 3; // TODO: Replace this magic number
}

- (NSColor *)NSColor
{
    switch (self.color) {
        case WMTileWhiteColor:
            return [NSColor whiteColor];
            break;
        case WMTileBlueColor:
            return [NSColor blueColor];
            break;
        case WMTileRedColor:
            return [NSColor redColor];
            break;
    }
}

@end
