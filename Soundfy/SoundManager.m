//
//  SoundManager.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import "SoundManager.h"
#import "BackgroundPlayer.h"

@implementation SoundManager

@synthesize isBackgroundMuted;
@synthesize isSoundEffectMuted;

NSString *isSoundEffectMutedKey = @"isSoundEffectsMuted";
NSString *isBackgroundMutedKey = @"isSoundBackgroundMuted";

NSMutableArray *players;

+ (SoundManager*)shared {
    static SoundManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SoundManager alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    isSoundEffectMuted = [defaults boolForKey:isSoundEffectMutedKey];
    isBackgroundMuted = [defaults boolForKey:isBackgroundMutedKey];
    players = [[NSMutableArray alloc] init];
    return self;
}

- (void)setMutedSoundEffects:(bool)isMuted {
    isSoundEffectMuted = isMuted;
    [[NSUserDefaults standardUserDefaults] setObject: @(isSoundEffectMuted) forKey:isSoundEffectMutedKey];
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@(isSoundEffectMuted) forKey:isSoundEffectMutedKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SoundfyMute"
                                                        object:self
                                                      userInfo:dict];
}

- (void)setMutedBackground:(bool)isMuted {
    isBackgroundMuted = isMuted;
    [[NSUserDefaults standardUserDefaults] setObject: @(isBackgroundMuted) forKey:isBackgroundMutedKey];
    [[BackgroundPlayer shared] stop];
}

/// Set global volume
/// @param volume new volume value
- (void)setVolume:(double)volume {
    globalVolume = volume;
}

/// Get global volume
- (double)getVolume {
    return globalVolume;
}

- (void)stopAll {
    for (int i = 0; i < players.count; i++) {
        [players[i] stop];
    }
}

- (void)pauseAll {
    for (int i = 0; i < players.count; i++) {
        [players[i] pause];
    }
}

@end
