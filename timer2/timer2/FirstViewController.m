//
//  FirstViewController.m
//  timer2
//
//  Created by Student on 5/12/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

NSArray *splitTimesSetup;
NSMutableArray *splitTimes;
NSString *currentSplitString;
int currentSplitNumber;


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _timeElapsed.text = @"zero";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateElapsed
{
    if (running == false) return;
    
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - startTime;
    
    
    
    int mins = (int)(elapsedTime/60);
    elapsedTime -= mins*60;
    int secs = (int)(elapsedTime);
    elapsedTime -= secs;
    int fraction = elapsedTime * 1000;
    
    _timeElapsed.text = [NSString stringWithFormat:@"%d:%02d.%0003d", mins, secs, fraction];
    
    
    
    
    [self performSelector:@selector(updateElapsed) withObject:self afterDelay:0.01];
    
}


- (IBAction)startTimer:(id)sender {
    //NSDate *startTime = [NSDate date];
    
    running = true;
    startTime = [NSDate timeIntervalSinceReferenceDate];
    [self updateElapsed];
    currentSplitNumber = 1;
    
    splitTimes = [[NSMutableArray alloc] init];
    
    //NSArray *splitTimesStart = [NSArray arrayWithObjects:@"0", nil];
    //NSMutableArray *splitTimes = [NSMutableArray arrayWithArray:splitTimesStart];
    
}

- (IBAction)splitTimer:(id)sender {
    [splitTimes addObject:_timeElapsed.text];
    //currentSplitString = _timeElapsed.text;
    //[splitTimes insertObject:currentSplitString atIndex:currentSplitNumber];
    
    currentSplitNumber += 1;
    
    
    [self showMessage];
}

- (IBAction)stopTimer:(id)sender {
    running = false;
    
    NSMutableString *splitTimesMessage = [[NSMutableString alloc] initWithString:@"Split times:"];
    
    for (int n = 0; n < [splitTimes count]; n++)
    {
        splitTimesMessage = [splitTimesMessage stringByAppendingString:@"\n"];
        splitTimesMessage = [splitTimesMessage stringByAppendingString:[splitTimes objectAtIndex:n]];
    }
    
    
    UIAlertView *results = [[UIAlertView alloc] initWithTitle:_timeElapsed.text
                                                      message:splitTimesMessage
                                                     delegate:nil
                                            cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [results show];
    [self showMessage];
    
    NSLog(@"splitTimesMessage %@", splitTimesMessage);
}

- (IBAction)saveSplitTimes:(id)sender {
    NSMutableArray *saved = [[NSMutableArray alloc] initWithArray:splitTimes];
    
    
    NSLog(@"saved: %@", saved);
}

- (void)showMessage
{
    //NSLog(@"array splitTimes %@", splitTimes);
    
    for (int i = 0; i < [splitTimes count]; i++)
    {
        NSLog(@"splitTimes %@ at index %i", [splitTimes objectAtIndex:i], i);
    }
    
    NSLog(@"currentSplitNumber %d", currentSplitNumber);
    
}







@end
