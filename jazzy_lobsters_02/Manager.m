//
//  Manager.m
//  jazzy_lobsters_02
//
//  Created by Georg Duemlein on 6/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import "Manager.h"
#import "Appkit/Appkit.h"

CGFloat RandomFloat()
{
    return (random() / (CGFloat)RAND_MAX);
}

@implementation Manager

- (id)initWithSize:(CGSize)size
{
    if (self = [super init])
    {
        boundsSize = size;
        colorSpace = CGColorSpaceCreateDeviceRGB();
        panels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    if (!layer)
    {
        layer = CGLayerCreateWithContext(ctx, boundsSize, NULL);
        CGContextRef ctx = CGLayerGetContext(layer);
        CGContextSetFillColorWithColor(ctx, CGColorGetConstantColor(kCGColorBlack));
        CGContextFillRect(ctx, CGRectMake(0, 0, boundsSize.width, boundsSize.height));
    }
    
    CGContextDrawLayerAtPoint(ctx, CGPointZero, layer);
}

- (void)animateOneFrame
{
    frameNum++;
    
    CGSize size = CGLayerGetSize(layer);
    
    CGRect rect;
    NSColor *color;
    
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
    
    CGContextRef ctx = CGLayerGetContext(layer);
    CGContextSetStrokeColorSpace(ctx, colorSpace);
    
    rect.size = CGSizeMake( size.width / 8, size.height / 5 );

    if (frameNum % 15 == 0 )
    {
        for (int row = 0; row <= 9; row++)
        {
            for (int col = 0; col <= 15; col++)
            {
                if (RandomFloat() > 0.9 )
                {
                rect.origin = CGPointMake(row * rect.size.width , col * rect.size.height);

                // Pick a random color
                NSUInteger rnd = arc4random_uniform([colors count]);

                color = [colors objectAtIndex:rnd];
                CGContextSetFillColorWithColor(ctx, color.CGColor);

                // And finally draw it
                CGContextFillRect(ctx, rect);
                }
            }
        }
    }
}

@end
