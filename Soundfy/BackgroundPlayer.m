//
//  BackgroundPlayer.m
//  Soundfy
//
//  Created by Albert on 20/07/21.
//

#import "BackgroundPlayer.h"

@implementation BackgroundPlayer

+ (SoundfyPlayer*)shared {
    static BackgroundPlayer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BackgroundPlayer alloc] init];
    });
    return sharedInstance;
}

@end
