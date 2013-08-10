//
//  Hello_iPhoneTests.m
//  Hello iPhoneTests
//
//  Created by Brian Partridge on 8/10/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import "Hello_iPhoneTests.h"

@implementation Hello_iPhoneTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in Hello iPhoneTests");
}

- (void)testAddition {
    STAssertTrue(2+2==5, @"Unable to put two and two together...");
}

@end
