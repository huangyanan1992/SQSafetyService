//
//  AVoidCrash.h
//  SQSafetyService
//
//  Created by Huang Yanan on 2017/2/8.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

//通知的名称，若要获取详细的崩溃信息，请监听此通知
#define SQVoidCrashNotification @"AvoidCrashNotification"
#define SQVoidCrashDefaultReturnNil  @"This framework default is to return nil."
#define SQVoidCrashDefaultIgnore     @"This framework default is to ignore this operation to avoid crash."

@interface SQVoidCrash : NSObject

/**
 *  开始生效.你可以在AppDelegate的didFinishLaunchingWithOptions方法中调用becomeEffective方法
 */
+ (void)sq_becomeEffective;

+ (void)sq_exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)sq_exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (NSString *)sq_getMainCallStackSymbolMessageWithCallStackSymbolStr:(NSString *)callStackSymbolStr;

+ (void)sq_noteErrorWithException:(NSException *)exception defaultToDo:(NSString *)defaultToDo;

@end
