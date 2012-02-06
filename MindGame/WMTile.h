//
//  WMTile.h
//  MindGame
//
//  Created by Wesley Moore on 6/02/12.
//  Copyright (c) 2012 TrikeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMTile : NSObject

typedef enum {
    WMTileWhiteColor = 0,
    WMTileBlueColor,
    WMTileRedColor,
} WMTileColor;

@property(assign) WMTileColor color;

- (void)tap;
- (NSColor *)NSColor;

@end
