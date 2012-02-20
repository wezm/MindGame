//
//  WMGame.h
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMTile.h"

@interface WMGame : NSObject

@property (strong) NSMutableArray *tiles;

- (void)tapTileAtIndex:(NSUInteger)index;
- (void)setState:(WMTileColor *)state;
- (void)solve;

@end
