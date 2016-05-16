#import "DetectWatch.h"
#import <WatchConnectivity/WatchConnectivity.h>

@implementation DetectWatch

+ (BOOL)watchIsPaired {
    return [WCSession defaultSession].isPaired;
}

@end
