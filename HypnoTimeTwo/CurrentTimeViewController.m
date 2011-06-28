//
//  CurrentTimeViewController.m
//  HypnoTimeOne
//
//  Created by Kevin Bowe on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController


- (void) viewWillAppear:(BOOL)animated
{
    // This is a 'potential' error in the book.  This code is NOT in the 
    // Downloaded solution...
    [super viewWillAppear:animated];
    // This line seems OK...
    [self showCurrentTime:nil];
    
    // This causes the time in the timeLabel to be reset every time
    // the view is displayed to '???'...
    //...[timeLabel setText:@"???"];
    
}

- (IBAction) showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    // Static here means "only once".  The variable formatter
    // is created when the program is first loaded inro memory.
    // The first time this method is invoked, formatted will
    // be nill and the if-block will execute, creating
    // and NSDateFormatted object that formatter will point to.
    // Subsequent entry into this method will reuse the same 
    // NSDateFormatted object...
    
    static NSDateFormatter *formatter = nil;
    if (!formatter) 
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        
    } // END_IF
    [timeLabel setText:[formatter stringFromDate:now]];
}

- (id) init
{
    // Removed for [git:feature/CreateViewsForControllers+] branch...
    // Call the superclass's designated initializer...
    //...[super initWithNibName:nil bundle:nil];
    [super initWithNibName:@"CurrentTimeViewController" bundle:nil];
    
    // Get the tab bar item...
    UITabBarItem *tbi = [self tabBarItem];
    
    // Give it a label...
    [tbi setTitle:@"Time"];
    
    /*
     Add Code to display the Hypnosis Icon 
     */
    
    UIImage *i = [UIImage imageNamed:@"Time.png"];
    [tbi setImage:i];
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Disregard parameters - implememtation detail...
    return [self init];
    
    /*  This code was created by xCode...
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    */ // xCode Generated...
}

- (void)dealloc
{
    [timeLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // Removed for [git:feature/CreateViewsForControllers+] branch...
    // Set background color of the view so we ca see it...
    //... [[self view] setBackgroundColor:[UIColor greenColor]];
}

- (void)viewDidUnload
{
    NSLog(@"Must have received a low memory warning. Releasing timeLabel");
    [timeLabel release];
    timeLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
