//
//  SoundfyPlayer.h
//  Soundfy
//
//  Created by Vinicius Mesquita on 19/07/21.
//
#import <Foundation/Foundation.h>

@interface SoundfyPlayer: NSObject {
    double volume;
    NSString *soundName;
}
@property(nonatomic, readwrite) double _volume;
@end
