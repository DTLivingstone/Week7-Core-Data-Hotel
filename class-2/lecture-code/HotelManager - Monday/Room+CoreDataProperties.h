//
//  Room+CoreDataProperties.h
//  HotelManager
//
//  Created by Adam Wallraff on 7/19/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Room.h"

NS_ASSUME_NONNULL_BEGIN

@interface Room (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *beds;
@property (nullable, nonatomic, retain) NSNumber *number;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) Hotel *hotel;
@property (nullable, nonatomic, retain) Reservation *reservation;

@end

NS_ASSUME_NONNULL_END
