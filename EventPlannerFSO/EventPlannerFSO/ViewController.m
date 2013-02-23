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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    NSString *path = (NSString *)[paths objectAtIndex:0];
    NSLog(@"%@",path);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(addEvent:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRightAddEvent addGestureRecognizer:rightSwipe];
    
}

-(void)viewDidAppear:(BOOL)animated
{
        NSUserDefaults *evenDetailList = [NSUserDefaults standardUserDefaults];
        NSString *eList = [evenDetailList objectForKey:@"eld"];
        if (eList != nil)
            {
                eventList.text = eList;
            }
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveEvents:(id)sender
{
    //Add Save Code here.
    NSUserDefaults *eventDetailList = [NSUserDefaults standardUserDefaults];
    
    if (eventDetailList != nil) {
        NSString *eList = eventList.text;
        
        [eventDetailList setObject:eList forKey:@"eld"];
        
        //save the list
        [eventDetailList synchronize];
        
        
    }
    NSLog(@"hit the Save Button, Not doing anything yet.");
}

-(void)addEvent:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        
    
    EventDetailViewController *eventDetailPage = [[EventDetailViewController alloc] initWithNibName:@"EventDetailViewController" bundle:nil];
    eventDetailPage.delegate = self;
        
    if (eventDetailPage != nil)
    {
        [ self presentViewController:eventDetailPage animated:TRUE completion:nil];
    }
   
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