//
//  ViewController.m
//  EventPlannerFSO
//
//  Created by Joel Johnson on 2/16/13.
//  Copyright (c) 2013 Joel Johnson. All rights reserved.
//

#import "ViewController.h"

#import "EventDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)addEvent:(id)sender
{
    EventDetailViewController *eventDetailPage = [[EventDetailViewController alloc] initWithNibName:@"EventDetailViewController" bundle:nil];
    eventDetailPage.delegate = self;
    if (eventDetailPage != nil)
    {
        [ self presentViewController:eventDetailPage animated:TRUE completion:nil];
    }
    
}

-(void)sendDetails:(NSString*)theEventDetails
{
    if (currentEvent != nil)
    {
        currentEvent = [currentEvent stringByAppendingString:theEventDetails];
    }
    else
    {
        currentEvent = [NSString stringWithFormat:@"%@" , theEventDetails];
    }

    eventList.text = currentEvent;

}

@end