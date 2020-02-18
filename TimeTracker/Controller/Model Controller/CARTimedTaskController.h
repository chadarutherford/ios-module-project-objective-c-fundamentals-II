//
//  CARTimedTaskController.h
//  TimeTracker
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CARTimedTask;

NS_ASSUME_NONNULL_BEGIN

@interface CARTimedTaskController : NSObject

@property (nonatomic, readonly) NSMutableArray<CARTimedTask *> *timedTasks;

- (void) createTimedTaskWithClient:(NSString *)client
                           summary:(NSString *)summary
                        hourlyRate:(double)hourlyRate
                       hoursWorked:(int)hoursWorked;

@end

NS_ASSUME_NONNULL_END
