//
//  BaseItem.m
//  jazzy_lobster_screensaver_01
//
//  Created by Georg Duemlein on 4/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import "BaseItem.h"
#import "NSColor+Interpolate.h"

@implementation BaseItem

+ (instancetype) itemWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height
{
    BaseItem *item = [[BaseItem alloc] initWithLife:life andX:x andY:y andWidth:width andHeight:height];
    return item;
}

- (id) initWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height{
    self = [super init];
    if (self)
    {
        
        NSMutableArray *colors = [NSMutableArray arrayWithCapacity:(4)];
        [colors addObject:[NSColor blackColor]];
        [colors addObject:[NSColor whiteColor]];
        [colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                    green:35.0 / 255.0
                                                     blue:159.0 / 255.0
                                                    alpha:1.0]];
        
        [colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                    green:78.0 / 255.0
                                                     blue:152.0 / 255.0
                                                    alpha:1.0]];
        // Pick a random color
        NSUInteger rnd = arc4random_uniform([colors count]);
        self.color =  [colors objectAtIndex:rnd];
        
        self.life = life;
        self.age = 0.0;
        self.background = [NSColor blackColor];
        
        NSRect rect = NSMakeRect(x, y, width, height);
        self.shape = [NSBezierPath bezierPathWithRect:rect];
    }
    return self;
}

-(float) step
{
    ++self.age;
    if (self.age > self.life)
    {
        self.age = 0.0;
    }
    return self.age / self.life;
}

-(void) draw
{
    NSColor *tmpc = [NSColor interpolateRGBColorFrom:self.background to:self.color withFraction:(self.age / self.life)];
    [tmpc set];
    [self.shape fill];
}

@end
