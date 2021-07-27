//
//  SoundManager.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import "SoundManager.h"
#import "BackgroundPlayer.h"
#import "SoundfyPlayer.h"
#import <Foundation/Foundation.h>


@implementation SoundManager

@synthesize isBackgroundMuted;
@synthesize isSoundEffectMuted;

NSString *isSoundEffectMutedKey = @"isSoundEffectsMuted";
NSString *isBackgroundMutedKey = @"isSoundBackgroundMuted";

NSMutableArray *players;
BackgroundPlayer *background;

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

- (void)playSound:(NSString *)soundName {
    [self playSound:soundName volume:1.0 loops:0];
}

- (void)playSound:(NSString *)soundName loops: (int)numberOfLoops {
    [self playSound:soundName volume:1.0 loops:numberOfLoops];
}

- (void)playSound:(NSString *)soundName volume: (double)volume {
    [self playSound:soundName volume:volume loops:0];
}

- (void)playSound:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops {
    if (isSoundEffectMuted) {
        return;
    }
    [self playSoundEffect:soundName volume:volume loops:numberOfLoops];
}

- (void)playSoundEffect:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops {
    SoundfyPlayer *player = [[SoundfyPlayer alloc] init];
    [players addObject:player];
    [player playSound:soundName volume:volume loops:numberOfLoops];
}

- (void)playBackgroundSound:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops {
    BackgroundPlayer *player = [[BackgroundPlayer alloc] init];
    background = player;
    [player playSound:soundName volume:volume loops:numberOfLoops];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [players removeObjectAtIndex: (int)current];
    NSLog(@"%d", flag);
}


@end
