//
//  FirstViewController.h
//  timer2
//
//  Created by Student on 5/12/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SplitsTableViewController.h"

NSArray *splitTimesSetup;
NSMutableArray *splitTimes;
NSString *currentSplitString;
int currentSplitNumber;

@interface FirstViewController : UIViewController
{
    bool running;
    NSTimeInterval startTime;
    //NSMutableArray *splitTimes;
}

@property (strong, nonatomic) IBOutlet UILabel *timeElapsed;

- (void)updateElapsed;

- (IBAction)startTimer:(id)sender;
- (IBAction)splitTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (IBAction)saveSplitTimes:(id)sender;


@property (strong, nonatomic) IBOutlet UITableView *viewSplitsTest;


@property (strong, nonatomic) IBOutlet UITableViewCell *viewSplit1;

- (void)showMessage;





@end

