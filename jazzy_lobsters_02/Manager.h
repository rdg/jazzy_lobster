//
//  Manager.h
//  jazzy_lobsters_02
//
//  Created by Georg Duemlein on 6/02/18.
//  Copyright © 2018 countasone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject
{
    CGSize boundsSize;
    NSMutableArray *panels;
    NSUInteger frameNum;
    CGLayerRef layer;
    CGColorSpaceRef colorSpace;
}

- (id)initWithSize:(CGSize)size;
- (void)drawInContext:(CGContextRef)ctx;
- (void)animateOneFrame;
@end
