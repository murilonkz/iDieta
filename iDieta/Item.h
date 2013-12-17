//
//  Item.h
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meal.h"


@interface Item : NSObject
@property(nonatomic)BOOL *popUp;
@property(strong,nonatomic)NSDate *alarm;
@property(strong,nonatomic)Meal *meal;

+(Item*)sharedItem;
@end
