//
//  API.h
//  lestreamer
//
//  Created by Michael T on 2015-05-10.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject

+(void)loginUsername:(NSString*)username
            password:(NSString*)password
             success:(void(^)(NSString* streamname))success
             failure:(void(^)(NSString* msg))failure;

@end
