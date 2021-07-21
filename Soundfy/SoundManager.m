//
//  SoundManager.m
//  Soundfy
//
//  Created by Vinicius Mesquita on 21/07/21.
//

#import "SoundManager.h"

@implementation SoundManager

+ (id)shared {
    static SoundManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SoundManager alloc] init];
    });
    return sharedInstance;
}
@end
