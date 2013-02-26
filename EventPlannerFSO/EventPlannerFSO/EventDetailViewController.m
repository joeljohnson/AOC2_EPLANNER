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
-(void)viewWillAppear:(BOOL)animated
{
    leftSwipeClose = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeLeft:)];
    leftSwipeClose.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLeftClose addGestureRecognizer:leftSwipeClose];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//clear the event text field when tapped
-(IBAction)clearText:(id)sender
{
    eventName.text = nil;
}

//close teh keyboard
-(IBAction)closeTheKeyboard:(id)sender
{
    [eventName resignFirstResponder];
}

//Capture Data and pass it back to the back to viewController
-(void)onSwipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
    
        eventDate = selectedDate.date;
        eventDescription = eventName.text;
        
        NSDateFormatter * eventDateFormat = [[NSDateFormatter alloc] init];
        if (eventDateFormat != nil)
        {
            [eventDateFormat setDateFormat:@"EEE, MMM d, yyyy @ hh:mm a"];
            eventDateFormatted = [eventDateFormat stringFromDate:eventDate];
           // NSLog(@"%@", eventDateFormatted);
        }
        //NSUserDefaults *eventDetailList = [NSUserDefaults standardUserDefaults];
        //NSString *eList = [eventDetailList objectForKey:@"eld"];

          //  theEventDetails = eList;
          //  savedEvents = [NSString stringWithFormat:@"%@\n%@\n\n", eventDescription, eventDateFormatted];
          //  theEventDetails = [theEventDetails stringByAppendingString:savedEvents];
 

            theEventDetails = [NSString stringWithFormat:@"%@\n%@\n\n", eventDescription, eventDateFormatted];
        

        
        
        [delegate sendDetails:theEventDetails];
        //NSLog(@"%@", theEventDetails);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }
}

@end
