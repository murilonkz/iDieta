//
//  Dieta.m
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Dieta.h"
#import "Alimento.h"

@implementation Dieta

- (void) addAlimento: (Alimento*) alimento;
{
    [[self alimentos]addObject:alimento];
}

@end
