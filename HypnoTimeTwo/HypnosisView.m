//
//  HypnosisView.m
//  HypnosisterOne
//
//  Created by Kevin Bowe on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView
@synthesize xShift, yShift;

/*
 Add this method for Shake Detection
 */
- (BOOL) canBecomeFirstResponder
{
    return YES;
}




/*
 Add this method to support Shake Detection.
 */
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // Shake is the only kind of motion for now,
    // but we should (for the future compatibility)
    // check the motion type.
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"shake started...");
        float r, g, b;
        r = random() % 256 / 256.0;
        g = random() % 256 / 256.0;
        b = random() % 256 / 256.0;
        
        [stripeColor release];
        stripeColor = [UIColor colorWithRed:r 
                                      green:g 
                                       blue:b 
                                      alpha:1];
        [stripeColor retain];
        [self setNeedsDisplay];
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    /*
     Add this block of code for Shake Detection
     */
    
    // Notice we explicitly retain the UIColor instance
    // returned by the convience method lightGrayColor,
    // because it is autoreleased and we need to keep it around
    // so we can use it in drawRect:.
    stripeColor = [[UIColor lightGrayColor] retain];
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // What rectangle am I filling?...
    CGRect bounds = [self bounds];
    
    // Where is its center?...
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // From the center, how far out to the corner?...
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Get the context being drawn upon...
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // All lines will be drawn 10 points wide...
    CGContextSetLineWidth(context, 10);
    
    /*
     Add this code block to support Shake Detection.
     */
    
    // Set the stroke color to light gray...
    [stripeColor setStroke];
    
//   Replaced with line above...
//    // Set the stroke color to light gray...
//    [[UIColor lightGrayColor] setStroke];
    
    // Draw concentric circles from the outside in...
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        // Added for Accelerometer...
        center.x += xShift;
        center.y += yShift;
        
        
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
        
    } // END_FOR
    
    
    /*---------------------------------------------------------------------------------------------
     *  Add text to the view
     *--------------------------------------------------------------------------------------------*/
    
    // Create a string
    NSString *text = @"Your are getting sleepy.";
    
    // Get a font to draw it in...
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    // Where am I going to draw it?...
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // Set the fill color...
    [[UIColor blackColor] setFill];
    
    // Set the shadow...
    CGSize offset = CGSizeMake(4,3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    // Draw the string...
    [text drawInRect:textRect withFont:font];
    
}


- (void)dealloc
{
    [stripeColor release];
    [super dealloc];
}

@end
