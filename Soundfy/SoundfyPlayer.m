//
//  SoundfyPlayer.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//

#import "SoundfyPlayer.h"

@implementation SoundfyPlayer

AVAudioPlayer *player;

- (id)init {
    self = [super init];
    return self;
}

/// Play a sound from a file
/// @param soundName sound file name without type
- (void)playSound:(NSString *)soundName {
    [self playSound:soundName volume:1.0 loops:1];
}

- (void)playSound:(NSString *)soundName loops: (int)numberOfLoops {
    [self playSound:soundName volume:1.0 loops:numberOfLoops];
}

- (void)playSound:(NSString *)soundName volume: (double)volume {
    [self playSound:soundName volume:volume loops:1.0];
}

- (void)playSound:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops {
    // Search for path of sound
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
    // Create url with the path
    NSURL *url = [NSURL fileURLWithPath:path];
    // Create error variable
    NSError *error;
    // Instatiate player with url and error.
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.volume = volume;
    player.numberOfLoops = numberOfLoops;
    player.delegate = self;
    [player play];
}


/// Set current player volume
/// @param volume new volume value
- (void)setVolume:(double)volume {
    player.volume = volume;
}

/// Get current player volume
- (double)getVolume {
    return player.volume;
}

- (void)pause {
    [player pause];
}

- (void)stop {
    [player stop];
}

- (void)play {
    [player play];
}


// MARK: AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"%d", flag);
}

@end
