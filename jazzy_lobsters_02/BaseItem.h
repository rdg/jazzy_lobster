//
//  BaseItem.h
//  jazzy_lobster_screensaver_01
//
//  Created by Georg Duemlein on 4/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/Appkit.h>

@interface BaseItem : NSObject
{
    CGSize boundsSize;
    CGLayerRef layer;
}
@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, retain) NSColor *color;
@property (assign) int colorId;
@property (nonatomic, retain) NSColor *background;
@property (assign) float life;
@property (assign) float age;
@property (nonatomic, retain) NSBezierPath *shape;

+ (instancetype) itemWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height;
- (id) initWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height;

- (float) step;
- (void) draw;

@end
