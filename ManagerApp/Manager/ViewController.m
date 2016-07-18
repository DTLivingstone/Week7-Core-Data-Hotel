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
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
