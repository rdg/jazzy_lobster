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
{
    NSDictionary *attributes;
    NSString *theText;
    int posX;
    int posY;
    
}

+ (instancetype) itemWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height
{
    BaseItem *item = [[BaseItem alloc] initWithLife:life andX:x andY:y andWidth:width andHeight:height];
    return item;
}

- (id) initWithLife:(float)life andX:(int)x andY:(int)y andWidth:(float)width andHeight:(float)height{
    self = [super init];
    if (self)
    {
        NSColorSpace *colorSpace = [NSColorSpace sRGBColorSpace];
        self.colors = [NSMutableArray arrayWithCapacity:(4)];
        [self.colors addObject:[NSColor colorWithColorSpace:colorSpace blackColor]];
        [self.colors addObject:[NSColor whiteColor]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                    green:35.0 / 255.0
                                                     blue:159.0 / 255.0
                                                    alpha:1.0]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                    green:78.0 / 255.0
                                                     blue:152.0 / 255.0
                                                    alpha:1.0]];
        // Pick a random color
        self.colorId = arc4random_uniform([self.colors count]);
        // self.color =  [self.colors objectAtIndex:rnd];
        posX = x;
        posY = y;
        self.life = life;
        self.age = 0.0;
        self.background = [NSColor grayColor];
        
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
    // NSColor *tmpc = [NSColor interpolateHSVColorFrom:self.background to:self.color withFraction:(self.age / self.life)];
    NSColor *foo = [self.colors objectAtIndex:self.colorId]; //[NSColor colorWithCalibratedRed:97.0 / 255.0
//                                             green:35.0 / 255.0
//                                              blue:159.0 / 255.0
//                                             alpha:1.0];
    attributes = @{NSFontAttributeName:[NSFont systemFontOfSize:24], NSForegroundColorAttributeName:[NSColor redColor]};
    theText = [NSString stringWithFormat:@"%d", foo.stringRepresentation];
    // [theText drawAtPoint:CGPointMake(5, 5) withAttributes:attributes];
    // CGFloat h2,s2,v2,a2;
    // [foo getHue:&h2 saturation:&s2 brightness:&v2 alpha:&a2];
    // NSColor *tmpc = [NSColor colorWithHue:h2 saturation:s2 brightness:(self.age / self.life) alpha:1.0];
    // [tmpc set];
    //[self.shape fill];
    [theText drawAtPoint:CGPointMake(posX, posY) withAttributes:attributes];
}

@end
