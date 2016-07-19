//
//  RoomsViewController.m
//  Manager
//
//  Created by David Livingstone on 7/19/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "RoomsViewController.h"
#import "AppDelegate.h"
#import "Room.h"
#import "Hotel.h"

@interface RoomsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *datasource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RoomsViewController

- (NSArray *)datasource {
    if (!_datasource) {
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSManagedObjectContext *context = delegate.managedObjectContext;
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        NSError *fetchError;
        
        _datasource = [context executeFetchRequest:request
                                             error:&fetchError];
        
        if (fetchError) {
            NSLog(@"error loading room data");
        }
    }
    
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupTableView];
    [self.navigationItem setTitle:@"Rooms"];
    
    for (Room *room in self.hotel.rooms) {
        NSLog(@"Room number: %@", room.number);
    }
}


- (void)setupTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RoomCell"];
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem: self.tableView
                                                               attribute: NSLayoutAttributeLeading
                                                               relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                               attribute: NSLayoutAttributeLeading
                                                              multiplier: 1.0 constant:0.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem: self.tableView
                                                            attribute: NSLayoutAttributeTrailing
                                                                relatedBy: NSLayoutRelationEqual toItem: self.view
                                                                attribute: NSLayoutAttributeTrailing multiplier: 1.0
                                                                 constant:0.0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem: self.tableView
                                                           attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self.view
                                                                attribute:NSLayoutAttributeTop
                                                          multiplier: 1.0
                                                            constant:0.0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem: self.tableView
                                                              attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.view
                                                              attribute: NSLayoutAttributeBottom multiplier: 1.0
                                                               constant:0.0];
    
    leading.active = YES;
    trailing.active = YES;
    top.active = YES;
    bottom.active = YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RoomCell"];
    }
    
//    NSLog(self.hotel);
    
    Room *room = (Room *)[self.hotel.rooms allObjects][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Number %@, beds: %@, rate: %@", room.number, room.beds, room.rate];
    
    return cell;
}
@end
