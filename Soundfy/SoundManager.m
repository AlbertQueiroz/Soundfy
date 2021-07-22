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
    self.isSoundEffectMuted = [defaults boolForKey:isSoundEffectMutedKey];
    self.isBackgroundMuted = [defaults boolForKey:isBackgroundMutedKey];
    return self;
}

- (void)setMutedSoundEffects:(bool)isMuted {
    self.isSoundEffectMuted = isMuted;
    [[NSUserDefaults standardUserDefaults] setObject: @(isSoundEffectMuted) forKey:isSoundEffectMutedKey];
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@(isSoundEffectMuted) forKey:isSoundEffectMutedKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SoundfyMute"
                                                        object:self
                                                      userInfo:dict];
}

- (void)setMutedBackground:(bool)isMuted {
    self.isBackgroundMuted = isMuted;
    [[NSUserDefaults standardUserDefaults] setObject: @(isBackgroundMuted) forKey:isBackgroundMutedKey];
    [[BackgroundPlayer shared] stop];
}

@end
