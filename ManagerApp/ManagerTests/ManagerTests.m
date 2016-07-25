//
//  ManagerTests.m
//  ManagerTests
//
//  Created by David Livingstone on 7/23/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BookViewController.h"
#import "NSObject+NSManagedObjectContext.h"

@interface ManagerTests : XCTestCase

@property (strong, nonatomic) BookViewController *bookViewController;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation ManagerTests

- (void)setUp {
    [super setUp];
    
    self.bookViewController = [[BookViewController alloc]init];
    self.bookViewController.end = [NSDate date];
    
    [self setContext:[NSManagedObjectContext managerContext]];
}

- (void)tearDown {
    [self setContext: nil];
    
    self.bookViewController = nil;
    
    [super tearDown];
}

- (void)testbookViewControllerNotNil {
    XCTAssertNotNil(self.bookViewController, @"bookViewController was nil");
}

- (void)testbookViewControllerDatenNotNill{
    XCTAssertNotNil(self.bookViewController.end, @"bookViewController.end was nil");
}

- (void)testManagerContextCreation {
    XCTAssertNotNil(self.context, @"managerContext was nil");
}

@end
