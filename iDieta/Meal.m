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
        
        switch (arc4random()%3) {
            case 1:
                [sharedMeal setQtdde:2];
                break;
            case 2:
                [sharedMeal setQtdde:3.5];
                break;
            default:
                [sharedMeal setQtdde:5];
                break;
        }
        
        if((arc4random()%2)==1) {
            [sharedMeal setName:@"Banana"];
        }else{
            [sharedMeal setName:@"Maça"];
        };
        
        float x =arc4random()%500;
        [sharedMeal setCal:x];
        
    }
    return sharedMeal;
};
@end

