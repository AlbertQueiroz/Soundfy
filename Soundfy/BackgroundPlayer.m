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
    // Search for path of sound
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
    // Create url with the path
    NSURL *url = [NSURL fileURLWithPath:path];
    // Create error variable
    NSError *error;
    // Instatiate player with url and error.
    super.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    super.player.volume = volume;
    super.player.numberOfLoops = numberOfLoops;
    super.player.delegate = self;
    [super.player play];
}

@end
