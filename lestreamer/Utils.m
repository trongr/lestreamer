//
//  Utils.m
//  lestreamer
//
//  Created by Michael T on 2015-05-09.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@implementation Utils

+(void)alert:(NSString*)message {
    [[[UIAlertView alloc] initWithTitle:@"INFO"
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

+(void)log:(NSString*)msg obj:(NSObject*)obj {
    NSLog(@"%@ %@", msg, obj);
}

@end
