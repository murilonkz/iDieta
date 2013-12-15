//
//  Diet.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Diet.h"
#import "Item.h"

@interface Diet ()
{
    
}
@end


@implementation Diet
@synthesize itens;

+(Diet*)sharedDiet{
    static Diet *sharedDiet=nil;
    if (!sharedDiet){
        sharedDiet = [[super alloc] init];
        [sharedDiet setItens:[[NSMutableArray alloc]initWithObjects:[Item.sharedDiet], nil]];
    }
    return sharedDiet;
};



@end
