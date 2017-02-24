//
//  NSDictionary+AVoidCrash.m
//  SQSafetyService
//
//  Created by Huang Yanan on 2017/2/8.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

#import "NSDictionary+SQVoidCrash.h"
#import "SQVoidCrash.h"

@implementation NSDictionary (SQVoidCrash)

+ (void)sq_voidCrashExchangeMethod {
    
    [SQVoidCrash sq_exchangeClassMethod:self method1Sel:@selector(dictionaryWithObjects:forKeys:count:) method2Sel:@selector(sq_voidCrashDictionaryWithObjects:forKeys:count:)];
    
}

+ (instancetype)sq_voidCrashDictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self sq_voidCrashDictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil key-values and instance a dictionary.";
        [SQVoidCrash sq_noteErrorWithException:exception defaultToDo:defaultToDo];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self sq_voidCrashDictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}



@end
