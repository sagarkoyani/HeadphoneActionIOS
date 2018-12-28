//
//  ViewController.m
//  stackTest
//
//  Created by Apple on 22/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self isHeadsetPluggedIn];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isHeadsetPluggedIn)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:[AVAudioSession sharedInstance]];
 
    
}

- (void)isHeadsetPluggedIn
{
    AVAudioSessionRouteDescription *route = [[AVAudioSession sharedInstance] currentRoute];
    
    BOOL headphonesLocated = NO;
    for( AVAudioSessionPortDescription *portDescription in route.outputs )
    {
        headphonesLocated |= ( [portDescription.portType isEqualToString:AVAudioSessionPortHeadphones] );
    }
    if (headphonesLocated) {
        NSLog(@"Pluged");
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.sw setOn:YES animated:YES];

        });
        
    
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.sw setOn:NO animated:YES];
        });
        
        NSLog(@"not pluged");
    
}

}


@end
