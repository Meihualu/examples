//
//  ViewController.m
//  WatchDetectorExample
//
//  Created by Armifer on 13/05/16.
//
//

#import "ViewController.h"
#import <WatchDetector/WatchDetector.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

- (IBAction)detectWatch {
    _infoLabel.text = [DetectWatch watchInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
