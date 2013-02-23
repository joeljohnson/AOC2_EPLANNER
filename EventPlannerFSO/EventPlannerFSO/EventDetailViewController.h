//
//  EventDetailViewController.h
//  EventPlannerFSO
//
//  Created by Joel Johnson on 2/17/13.
//  Copyright (c) 2013 Joel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol eventDetailsDelegate <NSObject>
-(void)sendDetails:(NSString*)newEventDetails;
@end


@interface EventDetailViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *eventName;
    IBOutlet UIButton *closeKeyboard;
    IBOutlet UIDatePicker *selectedDate;
    IBOutlet UILabel *swipeLeftClose;
    NSString * eventDateFormatted;
    NSDate * eventDate;
    NSString * eventDescription;
    NSString * theEventDetails;
    NSString * currentEvent;
    UISwipeGestureRecognizer *leftSwipeClose;
    
}

@property (nonatomic, strong) id<eventDetailsDelegate> delegate;

-(IBAction)clearText:(id)sender;
-(IBAction)closeTheKeyboard:(id)sender;



@end
