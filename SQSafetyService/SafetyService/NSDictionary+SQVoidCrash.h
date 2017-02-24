//
//  NSDictionary+AVoidCrash.h
//  SQSafetyService
//
//  Created by Huang Yanan on 2017/2/8.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SQVoidCrash)

+ (void)sq_voidCrashExchangeMethod;

@end
