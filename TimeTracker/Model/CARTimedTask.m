//
//  CARTimedTask.m
//  TimeTracker
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARTimedTask.h"

@implementation CARTimedTask

- (instancetype) initWithClient:(NSString *)client
                        summary:(NSString *)summary
                     hourlyRate:(double)hourlyRate
                    hoursWorked:(int)hoursWorked {
    self = [super init];
    if (self) {
        _client = client;
        _summary = summary;
        _hourlyRate = hourlyRate;
        _hoursWorked = hoursWorked;
    }
    return self;
}

- (double) total {
    return self.hourlyRate * self.hoursWorked;
}

@end
