//
//  CurrentTimeViewController.h
//  HypnoTimeOne
//
//  Created by Kevin Bowe on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CurrentTimeViewController : UIViewController {
    
    
    IBOutlet UILabel *timeLabel;
}

- (IBAction)showCurrentTime:(id)sender;

@end
