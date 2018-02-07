//
//  jazzy_lobsters_02View.m
//  jazzy_lobsters_02
//
//  Created by Georg Duemlein on 6/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import "jazzy_lobsters_02View.h"
#import "Manager.h"

@implementation jazzy_lobsters_02View

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        manager = [[Manager alloc] initWithSize:NSSizeToCGSize(frame.size)];
    }
    return self;
}

- (void)drawRect:(NSRect)rect
{
    [manager drawInContext:(CGContextRef)[[NSGraphicsContext currentContext] graphicsPort]];
}

- (void)animateOneFrame
{
    [manager animateOneFrame];
    [self setNeedsDisplay:YES];
}

@end
