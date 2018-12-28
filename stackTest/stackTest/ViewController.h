//
//  ViewController.h
//  stackTest
//
//  Created by Apple on 22/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *sw;
- (void)audioRouteChangeListenerCallback:(NSNotification*)notification;

@end

