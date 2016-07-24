//
//  ManagerTests.m
//  ManagerTests
//
//  Created by David Livingstone on 7/23/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BookViewController.h"

@interface ManagerTests : XCTestCase

@property (strong, nonatomic) BookViewController *bookViewController;

@end

@implementation ManagerTests

- (void)setUp {
    [super setUp];
    
    self.bookViewController = [[BookViewController alloc]init];
}

- (void)tearDown {
    self.bookViewController = nil;
    
    [super tearDown];
}

- (void)testBookViewControllerNotNil {
    XCTAssertNotNil(self.bookViewController, @"bookViewController was nil");
}

@end
