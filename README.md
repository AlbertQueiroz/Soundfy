## Soundfy

[![CocoaPods License](https://img.shields.io/cocoapods/l/SwiftySound.svg)](https://raw.githubusercontent.com/adamcichy/SwiftySound/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftySound.svg)](https://cocoapods.org/pods/SwiftySound)
[![CocoaPods Platforms](https://img.shields.io/cocoapods/p/SwiftySound.svg)](https://cocoapods.org/pods/SwiftySound)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![SPM ready](https://img.shields.io/badge/SPM-ready-orange.svg)](https://swift.org/package-manager/)
[![codecov](https://codecov.io/gh/adamcichy/SwiftySound/branch/master/graph/badge.svg)](https://codecov.io/gh/adamcichy/SwiftySound)

## Overview
Soundfy is a lib that helps you to manage the sound in your project, with simple abstractions and clean calls, you can create awesome applications with a great sound experience.

### Important classes
`SoundfyPlayer`: Can have multiple instances to play different sounds.\
`BackgroundPlayer`: Singlenton used for playing a single background sound and create effects all over the project.\
`SoundManager`: Singleton to manage general project sounds, just like mute all sounds or backgrounds sounds.

### Examples
#### Creating instances
Creating an instance has more benefits like the ability to adjust the volume and playback callbacks.
```swift
let player = SoundfyPlayer()
let backgroundPlayer = BackgroundPlayer.shared()
let manager = SoundManager.shared()
```
#### Simple Sounds
```swift
player.playSound("GameOver")
```
#### Background Music
```swift
backgroundPlayer?.playSound("MenuBackground")
```

More advanced examples:

```swift
player.playSound("GameOver", volume: 0.2, loops: 3)
```
The above will play the sound three times.

Specify a negative number of loops to play the sound continously in an infinite loop:

```swift
player.playSound("GameOver", volume: 0.2, loops: -1)
```

#### Muting All Sounds Sounds
```swift
manager?.setMutedSoundEffects(true)
manager?.setMutedBackground(true)
```
The value of `isMuted` property will be automatically persisted in `UserDefaults` and restored on the next launch of your app.

#### Change the volume

You can change the volume of each *SoundfyPlayer* instance.

```swift
player.setVolume(0.5)
```
The value of *volume* property should be between 0.0 and 1.0, where 1.0 is the maximum.

#### Callbacks

You can pass a callback to the `play` method. It will be played after the sound finished playing. For looped sounds, the callback will be called once after the last loop has been played.

```swift
mySound.play { completed in
    print("completed: \(completed)")
}
```
The callback is not called if the sound was stopped, interrupted or in case of a playback error.

## Features
- [x] Playing single sounds
- [x] Loops
- [x] Infinite loops
- [x] Playing the same sound multiple times simultaneously
- [x] Stopping all sounds with a global static method
- [x] Ability to pause and resume
- [x] Adjusting sound volume
- [x] Callbacks

## Requirements
- Swift/Objc
- Xcode 10.2 or later
- iOS 8.0 or later
- tvOS 9.0 or later
- macOS 10.9 or later

## Installation
### Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager which automates and simplifies the process of using third-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```ruby
platform :ios, '8.0'
use_frameworks!
pod 'SwiftySound'
```
### Installation with Carthage
[Carthage](https://github.com/Carthage/Carthage) is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods.

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage)

#### Cartfile
```
github "adamcichy/SwiftySound"
```

### Installation with Swift Package Manager
In your Xcode tool bar, follow the following steps to install the dependency.
```path
File > Swift Packages > Add Package Dependencie
```
Then paste the repository url:
https://github.com/AlbertQueiroz/Soundfy.git

##### Using in another package
Just add the url of this repo to your `Package.swift` file as a dependency:
```swift
import PackageDescription

let package = Package(
    name: "YourPackage",
    dependencies: [
        .Package(url: "https://github.com/AlbertQueiroz/Soundfy.git",
                 majorVersion: 0)
    ]
)
```

Then run `swift build` and wait for SPM to install SwiftySound.

### Manual installation
Drop the `Soundfy.framework` file into your project, link against `AVFoundation.framework` and you are ready to go.

## Licenses

Soundfy is licensed under the [MIT License](https://raw.githubusercontent.com/adamcichy/SwiftySound/master/LICENSE).
