//
//  Alimento.m
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Alimento.h"

@implementation Alimento
@synthesize idAlimento, nome, calorias, diaConsumo, horarioConsumo;


- (id) initWithId: (int)idAli andName:(NSString*)name andCalorias:(float)cal
{
    self = [super init];
    if (self) {
        [self setIdAlimento: idAli];
        [self setNome: name];
        [self setCalorias: cal];
    }
    return self;
}

@end
