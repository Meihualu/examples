//
//  ViewController.m
//  PodTester
//
//  Created by Brandon Zarzoza on 12/13/16.
//  Copyright © 2016 Zarzoza. All rights reserved.
//

#import "ViewController.h"
#import <UnityAds/UnityAds.h>

@interface ViewController ()<UnityAdsDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UnityAds initialize:@"14580" delegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)unityAdsReady:(NSString *)placementId {}
- (void)unityAdsDidStart:(NSString *)placementId {}
- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message {}
- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state {}
@end
