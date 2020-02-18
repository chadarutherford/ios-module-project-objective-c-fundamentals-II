//
//  CARTimeTrackerViewController.m
//  TimeTracker
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARTimeTrackerViewController.h"
#import "CARTimedTaskController.h"
#import "CARTimedTask.h"

@interface CARTimeTrackerViewController ()

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Properties
@property (nonatomic) NSString *client;
@property (nonatomic) NSString *summary;
@property (nonatomic) double hourlyRate;
@property (nonatomic) int hoursWorked;
@property (nonatomic) CARTimedTaskController *timedTaskController;

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Outlets
@property (weak, nonatomic) IBOutlet UITextField *clientTextField;
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *hourlyRateTextField;
@property (weak, nonatomic) IBOutlet UITextField *hoursWorkedTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CARTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timedTaskController = [[CARTimedTaskController alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (IBAction)logTime:(UIButton *)sender {
    self.client = self.clientTextField.text;
    self.summary = self.summaryTextField.text;
    self.hourlyRate = [self.hourlyRateTextField.text doubleValue];
    self.hoursWorked = [self.hoursWorkedTextField.text intValue];
    
    [self.timedTaskController createTimedTaskWithClient:self.client
                                                summary:self.summary
                                             hourlyRate:self.hourlyRate
                                            hoursWorked:self.hoursWorked];
    [self.tableView reloadData];
    [self clearTextFields];
}

- (void) clearTextFields {
    self.clientTextField.text = @"";
    self.summaryTextField.text = @"";
    self.hourlyRateTextField.text = @"";
    self.hoursWorkedTextField.text = @"";
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - TableView DataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.timedTaskController.timedTasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    CARTimedTask *task = [self.timedTaskController.timedTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.client;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", task.total];
    return cell;
}

@end
