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
@synthesize itens,nome;

+(Diet*)sharedDiet{
    static Diet *sharedDiet=nil;
    if (!sharedDiet){
        sharedDiet = [[super alloc] init];
        [sharedDiet setItens:[[NSMutableArray alloc]initWithObjects:[[Item alloc]init],[[Item alloc]init],[[Item alloc]init],[[Item alloc]init],[[Item alloc]init], nil]];
        [sharedDiet setNome:@"Dieta da Pança"];
        
    }
    return sharedDiet;
};

- (id)init
{
    self = [super init];
    if (self) {
        self = [Diet sharedDiet];
    }
    return self;
}

-(void)RemoveItem:(Item*)item{
    [[[Diet sharedDiet]itens]removeObject:item];
};


- (void)moveItemFrom:(int)from To:(int)to{
    Item *temp = [[[Diet sharedDiet]itens] objectAtIndex:from];
    [[[Diet sharedDiet]itens] removeObject:temp];
    [[[Diet sharedDiet]itens] insertObject:temp atIndex:to];
}


@end
