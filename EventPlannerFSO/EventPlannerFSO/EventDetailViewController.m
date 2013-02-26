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
    //get current date -set the min date on the datepicker - set the text color to gray.
    NSDate *Date = [NSDate date];
    selectedDate.minimumDate = Date;
    eventName.textColor = [UIColor grayColor];
}
-(void)viewWillAppear:(BOOL)animated
{
    //setup the gesture recognizer
    leftSwipeClose = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeLeft:)];
    leftSwipeClose.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLeftClose addGestureRecognizer:leftSwipeClose];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//clear the event text field when tapped switch color to black
-(IBAction)clearText:(id)sender
{
    eventName.text = nil;
    eventName.textColor = [UIColor blackColor];

}

//close the keyboard
-(IBAction)closeTheKeyboard:(id)sender
{
    [eventName resignFirstResponder];
}

//Capture Data and pass it back to the back to viewController
-(void)onSwipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        // grab the values
        eventDate = selectedDate.date;
        eventDescription = eventName.text;
        
       // format the date
        NSDateFormatter * eventDateFormat = [[NSDateFormatter alloc] init];
        if (eventDateFormat != nil)
        {
            [eventDateFormat setDateFormat:@"EEE, MMM d, yyyy @ hh:mm a"];
            eventDateFormatted = [eventDateFormat stringFromDate:eventDate];
        }

        //set the string to pass back
        theEventDetails = [NSString stringWithFormat:@"%@\n%@\n\n", eventDescription, eventDateFormatted];
        
        //pass the string to the delegate function
        [delegate sendDetails:theEventDetails];
        
        //dismiss the view
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }
}

@end
