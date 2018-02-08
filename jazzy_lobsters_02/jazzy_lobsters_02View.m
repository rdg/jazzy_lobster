//
//  jazzy_lobster_screensaver_01View.m
//  jazzy_lobster_screensaver_01
//
//  Created by Georg Duemlein on 2/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import "jazzy_lobsters_02View.h"
#import "BaseItem.h"
#import "NSColor+Interpolate.h"

@implementation jazzy_lobster_screensaver_01View

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        NSSize size;
        size = [self bounds].size;
        
        float width;
        float height;
        width = size.width / 16;
        height = size.height / 10;
        
        self.items =  [NSMutableArray arrayWithCapacity:(16 * 10)];
        for (int row=0; row < 10; row++) {
            for(int col=0; col < 16; col++) {
                [self.items addObject: [BaseItem itemWithLife:SSRandomIntBetween(10, 100) andX:(col * width) andY:(row * height) andWidth:width andHeight:height]];
            }
        }
    }

    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    for (int row=0; row < 10; row++) {
        for(int col=0; col < 16; col++) {
            BaseItem *item = self.items[row * 16 + col];
            [item step];
            [item draw];
        }
    }
}


- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
