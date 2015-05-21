//
//  SplitsTableViewController.h
//  timer2
//
//  Created by Student on 5/20/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FirstViewController.h"

@interface SplitsTableViewController : UITableViewController

@property NSMutableArray *savedSplits;

- (IBAction)refreshTable:(id)sender;



@end
