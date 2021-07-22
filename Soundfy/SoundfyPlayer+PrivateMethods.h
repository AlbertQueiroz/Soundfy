//
//  SoundfyPlayer+PrivateMethods.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 22/07/21.
//
#import <AVFoundation/AVFoundation.h>

@interface SoundfyPlayer()
- (void)play:(NSString *)soundName volume: (double)volume loops:(int)numberOfLoops;
@end
