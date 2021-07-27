//
//  SoundfyPlayer.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SoundManager.h"

@interface SoundfyPlayer: NSObject <AVAudioPlayerDelegate> {
    NSString *soundName;
    long index;
}

- (void)playSound:(NSString *)soundName;
- (void)playSound:(NSString *)soundName volume: (double)volume;
- (void)playSound:(NSString *)soundName loops: (int)numberOfLoops;
- (void)playSound:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops;

- (void)setVolume:(double)volume;
- (double)getVolume;

- (void)pause;
- (void)stop;
- (void)play;
@end
