//
//  NSColor+NSColorInterpolate.h
//  jazzy_lobster_screensaver_01
//
//  Created by Georg Duemlein on 4/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor (Interpolate)
+(NSColor *)interpolateRGBColorFrom:(NSColor *)start to:(NSColor *)end withFraction:(float)f;
+(NSColor *)interpolateHSVColorFrom:(NSColor *)start to:(NSColor *)end withFraction:(float)f;
@end
