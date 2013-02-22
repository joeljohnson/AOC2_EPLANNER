//
//  EventDetailViewController.m
//  EventPlannerFSO
//
//  Created by Joel Johnson on 2/17/13.
//  Copyright (c) 2013 Joel Johnson. All rights reserved.
//

#import "EventDetailViewController.h"

#import "ViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController;

@synthesize delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *Date = [NSDate date];
    selectedDate.minimumDate = Date;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clearText:(id)sender
{
    eventName.text = nil;
}

-(IBAction)closeTheKeyboard:(id)sender
{
    [eventName resignFirstResponder];
}

-(IBAction)onClick:(id)sender
{

    if (saveBtn.tag == 0)
    {
        eventDate = selectedDate.date;
        eventDescription = eventName.text;
        
        NSDateFormatter * eventDateFormat = [[NSDateFormatter alloc] init];
        if (eventDateFormat != nil)
        {
            [eventDateFormat setDateFormat:@"EEE, MMM d, yyyy @ hh:mm a"];
            eventDateFormatted = [eventDateFormat stringFromDate:eventDate];
            NSLog(@"%@", eventDateFormatted);
        }
        
        theEventDetails = [NSString stringWithFormat:@"%@\n%@\n\n", eventDescription, eventDateFormatted];
        
        [delegate sendDetails:theEventDetails];
        NSLog(@"%@", theEventDetails);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
