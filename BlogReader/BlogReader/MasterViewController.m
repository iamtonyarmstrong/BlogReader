//
//  MasterViewController.m
//  BlogReader
//
//  Created by Anthony Armstrong on 6/3/14.
//  Copyright (c) 2014 iamtonyarmstrong. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"



@implementation MasterViewController
            
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titlesArray = [[NSArray alloc]initWithObjects: @"Getting Started with Wordpress",
                                                        @"iOS Made Easy",
                                                        @"Python Without Getting Crushed",
                                                        @"HTML5 for Old Guys",
                                                        @"Javascript for Beginners",nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = self.titlesArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = self.titlesArray[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}


@end
