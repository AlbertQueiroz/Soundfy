//
//  SoundManager.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import <Foundation/Foundation.h>
#import "SoundfyPlayer.h"

@interface SoundManager: NSObject <AVAudioPlayerDelegate> {
    int globalVolume;
    int current;
    BOOL isBackgroundMuted;
    BOOL isSoundEffectMuted;
}

@property (nonatomic) bool isBackgroundMuted;
@property (nonatomic) bool isSoundEffectMuted;

+ (SoundManager*)shared;
- (void)setMutedSoundEffects:(bool)isMuted;
- (void)setMutedBackground:(bool)isMuted;

- (void)setVolume:(double)volume;
- (double)getVolume;

- (void)stopAll;
- (void)pauseAll;

- (void)playSound:(NSString *)soundName;
- (void)playSound:(NSString *)soundName volume: (double)volume;
- (void)playSound:(NSString *)soundName loops: (int)numberOfLoops;
- (void)playSound:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops;

@end
