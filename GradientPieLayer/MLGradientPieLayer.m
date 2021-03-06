//
//  MLGradientPieLayer.m
//  GradientPieLayer
//
//  Created by Matt Long on 12/16/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLGradientPieLayer.h"

@interface MLGradientPieLayer ()


@end

@implementation MLGradientPieLayer

- (instancetype)initWithRect:(CGRect)rect
{
    self = [super init];
    if (self) {
        // Give it some default gradient colors
        self.colors = @[(id)[[UIColor darkGrayColor] CGColor],
                        (id)[[UIColor lightGrayColor] CGColor]];
        
        // Linear gradient from left side to right side
        self.startPoint = CGPointMake(0.0f, 0.5f);
        self.endPoint = CGPointMake(1.0f, 0.5f);
        
        // Set our bounds based on what was passed in
        self.bounds = rect;
        
        // Initialize our shape layer and set its bounds and position
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.bounds = rect;
        _shapeLayer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
        
        // Create an inner rect we'll use for the bezier path rectangle
        CGRect innerRect = CGRectInset(rect, self.bounds.size.width/4.0f,
                                       self.bounds.size.height/4.0f);
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:innerRect cornerRadius:self.bounds.size.width/2.0f];
        
        // Set the path
        _shapeLayer.path = [bezierPath CGPath];
        
        // No fill color
        _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        
        // This color doesn't matter since we only care about whether or
        // not there is alpha when masking.
        _shapeLayer.strokeColor = [[UIColor redColor] CGColor];
        
        // Set the line with to half of the size since the stroke
        // is centered
        _shapeLayer.lineWidth = self.bounds.size.width/2.0f;
        
        // Set the mask
        self.mask = _shapeLayer;
    }
    return self;
}

- (void)setStart:(CGFloat)start
{
    _shapeLayer.strokeStart = start;
}

- (void)setEnd:(CGFloat)end
{
    _shapeLayer.strokeEnd = end;
}


@end
