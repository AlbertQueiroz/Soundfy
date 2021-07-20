//
//  SoundfyPlayer.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundfyPlayer: NSObject <AVAudioPlayerDelegate> {
    double volume;
    NSString *soundName;
}
- (void)playSound:(NSString *)soundName;
-(void)setVolume:(double)volume;
-(void)pause;
-(void)stop;
-(void)play;
@end
