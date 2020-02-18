//
//  CARTimedTaskController.m
//  TimeTracker
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARTimedTaskController.h"
#import "CARTimedTask.h"

@implementation CARTimedTaskController

- (instancetype)init {
    self = [super init];
    if (self) {
        _timedTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) createTimedTaskWithClient:(NSString *)client
                           summary:(NSString *)summary
                        hourlyRate:(double)hourlyRate
                       hoursWorked:(int)hoursWorked {
    CARTimedTask *task = [[CARTimedTask alloc] initWithClient:client summary:summary hourlyRate:hourlyRate hoursWorked:hoursWorked];
    [self.timedTasks addObject:task];
}

- (void) updateTask:(CARTimedTask *)task
         withClient:(NSString *)client
            summary:(NSString *)summary
         hourlyRate:(double)hourlyRate
        hoursWorked:(int)hoursWorked {
    task.client = client;
    task.summary = summary;
    task.hourlyRate = hourlyRate;
    task.hoursWorked = hoursWorked;
}
@end
