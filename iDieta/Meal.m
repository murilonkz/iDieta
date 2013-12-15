//
//  Meal.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Meal.h"

@interface  Meal()
{
    
}
@end


@implementation Meal

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+(Meal*)sharedMeal{
    static Meal *sharedMeal=nil;
    if (!sharedMeal){
        sharedMeal = [[super alloc] init];
        
        if (arc4random()%2==1) {
            [sharedMeal setName:@"Banana"];
        }else{
            [sharedMeal setName:@"Maça"];
        };
        
        
        
        [sharedMeal setCal:x];
        
        
        if (arc4random()%2==1) {
            [sharedMeal setPopUp:NO];
        }else{
            [sharedMeal setPopUp:YES];
        };
        
        
    }
    return sharedMeal;
};
@end

