//
//  BookViewController.m
//  Manager
//
//  Created by David Livingstone on 7/20/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "BookViewController.h"
#import "NSObject+NSManagedObjectContext.h"

@interface BookViewController ()

@property(strong, nonatomic) UITextField *firstNameField;
@property(strong, nonatomic) UITextField *LastNameField;
@property(strong, nonatomic) UITextField *emailField;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupBookViewController];
}


-(void)setupBookViewController{
    
    [self.navigationItem setTitle:self.room.hotel.name];
    
//    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
    
}




@end