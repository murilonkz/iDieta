//
//  Meal.h
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meal : NSObject
@property(nonatomic)float qtdde;
@property (strong,nonatomic)NSString *name;
@property(nonatomic)float cal;

+(Meal*)sharedMeal;

@end
