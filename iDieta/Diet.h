//
//  Diet.h
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Diet : NSObject
@property(strong,nonatomic)NSString *nome;
@property(strong,nonatomic)NSMutableArray *itens;

+(Diet*)sharedDiet;
-(void)RemoveItem:(Item*)item;
- (void)moveItemFrom:(int)from To:(int)to;
@end
