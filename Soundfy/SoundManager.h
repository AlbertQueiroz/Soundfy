//
//  SoundManager.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import <Foundation/Foundation.h>
#import "SoundfyPlayer.h"

@interface SoundManager: NSObject {
    int globalVolume;
    BOOL isBackgroundMuted;
    BOOL isSoundEffectMuted;
}

@property (nonatomic) bool isBackgroundMuted;
@property (nonatomic) bool isSoundEffectMuted;
@property (nonatomic) NSMutableArray *players;

+ (SoundManager*)shared;
- (void)setMutedSoundEffects:(bool)isMuted;
- (void)setMutedBackground:(bool)isMuted;

- (void)setVolume:(double)volume;
- (double)getVolume;

- (void)stopAll;
- (void)pauseAll;
@end
