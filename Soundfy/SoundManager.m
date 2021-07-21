//
//  SoundManager.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import "SoundManager.h"
#import "BackgroundPlayer.h"

@implementation SoundManager

+ (id)shared {
    static SoundManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SoundManager alloc] init];
    });
    return sharedInstance;
}

- (void)setMutedSoundEffects:(bool)isMuted {
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@YES forKey:@"isMuted"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SoundfyMute"
                                                        object:self
                                                      userInfo:dict];
}

- (void)setMutedBackground:(bool)isMuted {
    [[BackgroundPlayer shared] setMuted:YES];
}

@end
