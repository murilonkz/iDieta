//
//  Dieta.h
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alimento.h"
@interface Dieta : NSObject

@property (nonatomic) NSInteger idDieta;
@property (nonatomic) NSString *nome;
@property (nonatomic) NSMutableArray *alimentos;
@property (nonatomic) float caloriasDiarias;


- (void) addAlimento: (Alimento*) alimento;

@end
