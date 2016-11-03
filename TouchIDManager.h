//
//  TouchIDManager.h
//  projectNYiT
//
//  Created by Soji Balogun on 11/3/16.
//  Copyright © 2016 Soji Balogun. All rights reserved.
//

#ifndef PITouchIDManager_h
#define PITouchIDManager_h

#import <Foundation/Foundation.h>

@interface TouchIDManager : NSObject

+ (void)authenticateUserWithSuccess:(void (^)(BOOL result))successBlock
                            failure:(void (^)(NSError *error))failureBlock;

@end
#endif /* PITouchIDManager_h */

