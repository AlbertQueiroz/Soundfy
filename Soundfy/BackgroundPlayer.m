//
//  BackgroundPlayer.m
//  Soundfy
//
//  Created by Albert on 20/07/21.
//

#import "BackgroundPlayer.h"
#import "SoundfyPlayer+PrivateMethods.h"


@implementation BackgroundPlayer


+ (BackgroundPlayer*)shared {
    static BackgroundPlayer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BackgroundPlayer alloc] init];
    });
    return sharedInstance;
}

- (void)playSound:(NSString *)soundName volume:(double)volume loops:(int)numberOfLoops {
    if ([SoundManager shared].isBackgroundMuted) {
        return;
    }
    [super play:soundName volume:volume loops:numberOfLoops];
}

@end
