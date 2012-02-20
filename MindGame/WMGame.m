//
//  WMGame.m
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import "WMGame.h"

static NSUInteger TILE_COUNT = 9;

@implementation WMGame

@synthesize tiles=_tiles;

- (id)init
{
    self = [super init];
    if (self != nil) {
        NSMutableArray *tiles = [[NSMutableArray alloc] initWithCapacity:TILE_COUNT];
        for (int i = 0; i < TILE_COUNT; i++) {
            [tiles addObject:[WMTile new]];
        }
        self.tiles = tiles;
    }
    
    return self;
}

- (void)tapTileAtIndex:(NSUInteger)index
{
    NSUInteger lastTileIndex = TILE_COUNT - 1;

    if (index != lastTileIndex) {
        NSUInteger leftIndex = (index == 0 ? lastTileIndex : index) - 1;
        NSUInteger rightIndex = (index + 1) % lastTileIndex;
        
        [[self.tiles objectAtIndex:leftIndex] tap];
        [[self.tiles objectAtIndex:rightIndex] tap];
    }

    [[self.tiles objectAtIndex:index] tap];
    NSLog(@"Tapped tile %lu", (unsigned long)index);
}

- (void)setState:(WMTileColor *)state
{
    [self.tiles enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        WMTile *tile = obj;
        tile.color = state[index];
    }];
}

- (void)solve
{
    // TODO: Given the current state, find the specific and fewest touches to get to all white
}

@end
