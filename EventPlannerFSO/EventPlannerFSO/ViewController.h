//
//  ViewController.h
//  EventPlannerFSO
//
//  Created by Joel Johnson on 2/16/13.
//  Copyright (c) 2013 Joel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailViewController.h"

@interface ViewController : UIViewController <eventDetailsDelegate>
{
    NSString * currentEvent;
    IBOutlet UITextView *eventList;
}

-(IBAction)addEvent:(id)sender;

@end
