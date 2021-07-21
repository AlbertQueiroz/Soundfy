//
//  SoundfyPlayer.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//

#import "SoundfyPlayer.h"

@implementation SoundfyPlayer

AVAudioPlayer *player;

-(id)init {
    self = [super init];
    volume = 1.0;
    NSLog(@"Hello, the volume is %f", volume);
    return self;
}

/// Play a sound from a file
/// @param soundName sound file name without type
-(void)playSound:(NSString *)soundName {
    // Search for path of sound
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
    // Create url with the path
    NSURL *url = [NSURL fileURLWithPath:path];
    // Create error variable
    NSError *error;
    // Instatiate player with url and error.
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = 1;
    player.volume = volume;
    player.delegate = self;
    [player play];
}

/// Set current player volume
/// @param volume new volume value
-(void)setVolume:(double)volume {
    player.volume = volume;
}

-(void)pause {
    [player pause];
}

-(void)stop {
    [player stop];
}

-(void)play {
    [player play];
}


// MARK: AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"%d", flag);
}

@end
