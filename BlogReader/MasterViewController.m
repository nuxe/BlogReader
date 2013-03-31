//
//  MasterViewController.m
//  BlogReader
//
//  Created by Class Account on 3/30/13.
//  Copyright (c) 2013 Kush Agrawal. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"


@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titlesArray = [NSArray arrayWithObjects:@"Getting Started with Twitter Bootstrap", @"How to hire a (code) monkey", @"3", @"4",@"5",@"6", @"7",@"8",@"9",@"10", nil];
                        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titlesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = self.titlesArray[indexPath.row];
//    [[self.titlesArray objectAtIndex:2] uppercaseString];
    
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *title = self.titlesArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:title];
    }
}

@end
