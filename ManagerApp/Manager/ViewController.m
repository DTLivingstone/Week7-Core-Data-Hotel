//
//  ViewController.m
//  Manager
//
//  Created by David Livingstone on 7/18/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    
    [self setupCustomLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewController];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setupViewController {
    [self.navigationItem setTitle:@"🏨 💁"];
}

- (void)setupCustomLayout {
    // get nav bar height
    
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    // create buttons
    
    
    
    // set button titles
    
    // set button background colors
    
    // set button title colors
    
    // set button autoresizing
    
    // set button constraints
    
    // add buttons
    
    // activate constraints
    
    // set up actions
}

// set up button handlers

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
