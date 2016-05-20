//
//  ViewController.m
//  WatchDetectorExample
//
//  Created by Armifer on 13/05/16.
//
//

#import "ViewController.h"
#import <WatchDetector/WatchDetector.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () <WCSessionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

- (IBAction)detectWatch {
    _infoLabel.text = [DetectWatch watchIsPaired] ? @"Watch Paired" : @"No watch paired";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[WCSession defaultSession] activateSession];
    
    if ([WCSession isSupported]) { // check if the device support to handle an Apple Watch
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession]; // activate the session
        
        if ([session isPaired]) { // Check if the iPhone is paired with the Apple Watch
            // Do stuff
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
