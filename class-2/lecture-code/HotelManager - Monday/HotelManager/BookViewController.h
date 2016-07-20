//
//  BookViewController.h
//  HotelManager
//
//  Created by Adam Wallraff on 7/19/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "Hotel.h"
#import "Reservation.h"
#import "Gues.h"

@interface BookViewController : UIViewController

@property(strong, nonatomic)Room *room;
@property(strong, nonatomic)NSDate *endDate;


@end
