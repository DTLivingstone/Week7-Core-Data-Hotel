//
//  NSObject+NSManagedObjectContext.h
//  HotelManager
//
//  Created by Adam Wallraff on 7/19/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface NSObject (NSManagedObjectContext)

+(NSManagedObjectContext *)managerContext;

@end
