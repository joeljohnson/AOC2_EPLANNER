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
    // this is just practice for folder stuff leaving it in for now.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    NSString *path = (NSString *)[paths objectAtIndex:0];
    NSLog(@"%@",path);
    
    // grab whats in defaults and displays it if there is anything.
    NSUserDefaults *eventDetailList = [NSUserDefaults standardUserDefaults];
    NSString *eList = [eventDetailList objectForKey:@"eld"];
    if (eList != nil)
    {
        eventList.text = eList;
    }
    
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
        
        UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your list has been saved!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [success show];
        
    }
    NSLog(@"Hit the Save Button");
}

- (IBAction)clearEvents:(id)sender
{

    
    NSString *emptyString = [NSString stringWithFormat:@""];
    eventList.text = emptyString;
    NSUserDefaults *eventDetailList = [NSUserDefaults standardUserDefaults];
    if (eventDetailList != nil) {
        [eventDetailList setObject:emptyString forKey:@"eld"];
        [eventDetailList synchronize];

    }
    
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
    //Check for Existing List using NSUserDefaults and then append.
    NSUserDefaults *eventDetailList = [NSUserDefaults standardUserDefaults];
    NSString *eList = [eventDetailList objectForKey:@"eld"];
    
    if (eList != nil)
    {
        
        eList = [eList stringByAppendingString:theEventDetails];
    }
    else
    {
        eList = [NSString stringWithFormat:@"%@" , theEventDetails];
    }

    eventList.text = eList;
    
}



@end