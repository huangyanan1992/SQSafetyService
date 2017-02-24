//
//  NSArray+AVoidCrash.m
//  SQSafetyService
//
//  Created by Huang Yanan on 2017/2/8.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

#import "NSArray+SQVoidCrash.h"
#import "SQVoidCrash.h"

@implementation NSArray (SQVoidCrash)

+ (void)sq_voidCrashExchangeMethod {
    [SQVoidCrash sq_exchangeInstanceMethod:[self class] method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(sq_voidCrashObjectAtIndexedSubscript:)];
    
    [SQVoidCrash sq_exchangeClassMethod:self method1Sel:@selector(arrayWithObjects:count:) method2Sel:@selector(sq_voidCrashArrayWithObjects:count:)];
    
}

//- (id)sq_voidCrashObjectAtIndex:(NSUInteger)idx {
//    id instance = nil;
//    
//    @try {
//        instance = [self aVoidCrashObjectAtIndex:idx];
//    }
//    @catch (NSException *exception) {
//        
//        NSString *defaultToDo = @"";
//        [AVoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
//        
//        //处理错误的数据，然后重新初始化一个字典
//        if (self.count <= idx) {
//            NSLog(@"数组越界");
//        }
//        instance = [self aVoidCrashObjectAtIndex:idx];
//    }
//    @finally {
//        return instance;
//    }
//}

- (id)sq_voidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id instance = nil;
    
    @try {
        instance = [self sq_voidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"[__NSArrayI objectAtIndex:]: index beyond bounds";
        [SQVoidCrash sq_noteErrorWithException:exception defaultToDo:defaultToDo];
        
        if (self.count <= idx) {
            NSLog(@"数组越界");
        }
        instance = [self sq_voidCrashObjectAtIndexedSubscript:idx];
    }
    @finally {
        return instance;
    }
}

+ (instancetype)sq_voidCrashArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    id instance = nil;
    
    @try {
        instance = [self sq_voidCrashArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"";
        [SQVoidCrash sq_noteErrorWithException:exception defaultToDo:defaultToDo];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i]) {
                newObjects[index] = objects[i];
                index++;
            }
        }
        instance = [self sq_voidCrashArrayWithObjects:newObjects count:index];
    }
    @finally {
        return instance;
    }
}

@end
