//
//  TableViewObjectiveCController.m
//  iosuitableview
//
//  Created by Christoph Purrer on 11/5/18.
//  Copyright © 2018 Christoph Purrer. All rights reserved.
//

// See: https://www.journaldev.com/10515/ios-simple-tableview-example-tutorial
#import "TableViewObjectiveCController.h"
typedef void(^MyCustomBlock)(void);

@interface TableViewObjectiveCController ()
@property (nonatomic, copy) MyCustomBlock customBlock;
@end

@implementation TableViewObjectiveCController

- (void)viewDidLoad {
    [super viewDidLoad];
    _customBlock = ^{
        NSLog(@"This is a block");
    };
    // Do any additional setup after loading the view, typically from a nib.
    tableData =[[NSMutableArray alloc]initWithObjects:@"uno", @"dos",@"tres",@"cuatro",@"cinco cinco cinco cinco cinco cinco cincocinco cinco cinco cinco cinco cinco cincocinco cinco cinco cinco cinco cinco cincocinco cinco cinco cinco cinco cinco cincocinco cinco cinco cinco cinco cinco cinco",@"seis",@"siete",@"ocho", @"nueve", @"dd", @"eee", @"fff", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [tableData count] / 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"SimpleTableId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        [NSThread sleepForTimeInterval:.1];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *stringForCell;
    if (indexPath.section == 0) {
        stringForCell = [tableData objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1){
        stringForCell= [tableData objectAtIndex:indexPath.row+ [tableData count]/3];
        
    }
    else if (indexPath.section == 2){
        stringForCell= [tableData objectAtIndex:indexPath.row+ 2*[tableData count]/3];
    }
    [cell.textLabel setText:stringForCell];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"FIRST";
    }
    else if (section == 1) {
        return @"SECOND";
    }
    return @"THIRD";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return @"FIRST";
    }
    else if (section == 1) {
        return @"SECOND";
    }
    return @"THIRD";
}

#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.customBlock();
    NSLog(@"Section:%d Row:%d selected and its data is %@", indexPath.section,indexPath.row,cell.textLabel.text);
}

@end
