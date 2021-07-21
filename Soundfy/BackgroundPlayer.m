//
//  BackgroundPlayer.m
//  Soundfy
//
//  Created by Albert on 20/07/21.
//

#import "BackgroundPlayer.h"

@implementation BackgroundPlayer

+ (id)shared {
    static BackgroundPlayer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BackgroundPlayer alloc] init];
    });
    return sharedInstance;
}

@end
