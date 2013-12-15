//
//  Item.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Item.h"

@interface Item ()
{
    
}
@end


@implementation Item
@synthesize popUp,alarm,meal;
+(Item*)sharedItem{
    static Item *sharedItem=nil;
    if (!sharedItem){
        sharedItem = [[super alloc] init];
        [sharedItem setAlarm:[[NSDate alloc]initWithTimeIntervalSinceNow:arc4random()%24*60*60*7]];
    }
    return sharedItem;
};



- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


@end
