//
//  HotelsViewController.m
//  Manager
//
//  Created by David Livingstone on 7/19/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "RoomsViewController.h"
#import "NSObject+NSManagedObjectContext.h"

@interface HotelsViewController () <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

//@property (strong, nonatomic) NSArray *datasource;
@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[NSManagedObject managerContext] sectionNameKeyPath:nil cacheName:nil];
        _fetchedResultsController.delegate = self;
        NSError *error;
        [_fetchedResultsController performFetch:&error];
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"Fetch successful");
            
        }
    }
    return _fetchedResultsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableView
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:0.0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:0.0];
    // activate constraints
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    bottom.active = YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Hotel *hotel = [self.fetchedResultsController objectAtIndexPath: indexPath];
    cell.textLabel.text = hotel.name;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Hotel *hotel = [self.fetchedResultsController objectAtIndexPath: indexPath];
    RoomsViewController *roomsViewController = [[RoomsViewController alloc]init];
    
    roomsViewController.hotel = hotel;
    
    [self.navigationController pushViewController:roomsViewController animated:YES];
}

@end
