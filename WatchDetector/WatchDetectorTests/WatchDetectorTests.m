//
//  WatchDetectorTests.m
//  WatchDetectorTests
//
//  Created by Armifer on 13/05/16.
//
//

#import <XCTest/XCTest.h>
#import <WatchDetector/WatchDetector.h>

@interface WatchDetectorTests : XCTestCase

@end

@implementation WatchDetectorTests

- (void)testGetInfo {
    XCTAssert([DetectWatch watchIsPaired], @"watch isn't paired");
}

@end
