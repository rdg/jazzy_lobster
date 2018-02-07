//
//  NSColor+NSColorInterpolate.m
//  jazzy_lobster_screensaver_01
//
//  Created by Georg Duemlein on 4/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

// https://stackoverflow.com/questions/22868182/uicolor-transition-based-on-progress-value

#import "NSColor+Interpolate.h"

@implementation NSColor (Interpolate)
+(NSColor *)interpolateRGBColorFrom:(NSColor *)start to:(NSColor *)end withFraction:(float)f
{
    f = MAX(0, f);
    f = MIN(1, f);
    
    const CGFloat *c1 = CGColorGetComponents(start.CGColor);
    const CGFloat *c2 = CGColorGetComponents(end.CGColor);
    
    CGFloat r = c1[0] + (c2[0] - c1[0]) * f;
    CGFloat g = c1[1] + (c2[1] - c1[1]) * f;
    CGFloat b = c1[2] + (c2[2] - c1[2]) * f;
    CGFloat a = c2[3];
    
    return [NSColor colorWithRed:r green:g blue:b alpha:a];
}
@end
