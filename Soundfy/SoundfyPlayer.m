//
//  SoundfyPlayer.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//

#import <Foundation/Foundation.h>
#import <Soundfy/SoundfyPlayer.h>

@implementation SoundfyPlayer

-(id)init {
    self = [super init];
    self._volume = 1.0;
    NSLog(@"Hello, the volume is %f", self._volume);
    return self;
}

@end
