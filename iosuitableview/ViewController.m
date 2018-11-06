//
//  ViewController.m
//  iosuitableview
//
//  Created by Christoph Purrer on 11/5/18.
//  Copyright © 2018 Christoph Purrer. All rights reserved.
//

#import "ViewController.h"
#import "iosuitableview-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tableViewObjectiveC:(id)sender {
    NSLog(@"tableViewObjectiveC");
    [self performSegueWithIdentifier:@"launchTableViewObjectiveCController" sender:self];
}

- (IBAction)tableViewSwift:(id)sender {
    NSLog(@"tableViewSwift");
    TableViewSwiftController *tableViewSwiftController = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewSwiftController"];
    [self presentViewController:tableViewSwiftController animated:NO completion:nil];
}

@end
