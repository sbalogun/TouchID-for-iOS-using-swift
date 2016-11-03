//
//  TouchIDManager.m
//  projectNYiT
//
//  Created by Soji Balogun on 11/3/16.
//  Copyright © 2016 Soji Balogun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TouchIDManager.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation TouchIDManager

+ (void)authenticateUserWithSuccess:(void (^)(BOOL result))successBlock
                            failure:(void (^)(NSError *error))failureBlock {
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"String explaining why app needs authentication";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply: ^(BOOL success, NSError *error) {
                                if (success) {
                                    if (successBlock) {
                                        successBlock(success);
                                    }
                                }
                                else {
                                    if (failureBlock) {
                                        failureBlock(error);
                                    }
                                }
                            }];
    }
    else {
        failureBlock(authError);
    }
}

@end
