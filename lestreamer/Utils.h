//
//  Utils.h
//  lestreamer
//
//  Created by Michael T on 2015-05-09.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(void)alert:(NSString*)message;
+(void)log:(NSString*)message obj:(NSObject*)obj;

@end
