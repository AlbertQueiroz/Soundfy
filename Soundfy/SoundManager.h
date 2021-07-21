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
    bool isBackgroundMuted;
    bool isSoundEffectMuted;
}

+ (id)shared;
- (void)setMutedSoundEffects:(bool)isMuted;
- (void)setMutedBackground:(bool)isMuted;
@end
