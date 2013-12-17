//
//  Alimento.h
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alimento : NSObject

@property (nonatomic) int idAlimento;
@property (nonatomic) NSString *nome;
@property (nonatomic) float calorias;
@property (nonatomic) NSString *diaConsumo;
@property (nonatomic) NSString *horarioConsumo;

@end
