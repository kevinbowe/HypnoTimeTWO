//
//  HypnosisView.h
//  HypnosisterOne
//
//  Created by Kevin Bowe on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HypnosisView : UIView {
    
    UIColor *stripeColor; // Add for Shake Detection...
    float xShift, yShift;
}

@property (nonatomic, assign) float xShift;
@property (nonatomic, assign) float yShift;

@end
