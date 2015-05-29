//
//  API.m
//  lestreamer
//
//  Created by Michael T on 2015-05-10.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import "AFNetworking.h"
#import "API.h"
#import "Utils.h"

@implementation API

+(void)loginUsername:(NSString*)username
            password:(NSString*)password
             success:(void(^)(NSString *streamname))success
             failure:(void(^)(NSString *msg))failure {
    // todo. putting stream name and password in URL only for server side debugging purposes.
    // the real parameters are in NSDictionary *parameters. not safe!!!
    // TODO. change server URL
    NSString* url = [NSString stringWithFormat:@"http://login.server.co/streamerlogin/%@/%@", username, password];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"stream":username, @"password":password};
    [manager POST:url
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [Utils log:@"INFO login response" obj:responseObject];
              NSString *streamname = [responseObject objectForKey:@"streamname"];
              streamname = username; // TODO remove once server responds with streamname
              if (streamname){
                  success(streamname);
              } else {
                  // TODO wrong username/password message
                  failure(@"ERROR login null streamname");
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              failure(@"Login request failed");
              [Utils log:@"ERROR login request" obj:error];
          }];
}

@end
