//
//  DietaModel.h
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Dieta.h"
#import "Alimento.h"
@interface DietaModel : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *DB;



+ (DietaModel *)sharedModel;

- (BOOL) addDieta: (Dieta*)dieta;
- (NSMutableArray*)getAllDietas;
- (BOOL) addAlimentos: (NSMutableArray*)alimentos naDietaId:(int)idDieta;
- (BOOL) removerAlimentoId: (int)idAlimento daDietaId:(int)idDieta;
- (BOOL) removerDietaId: (int)idDieta;
- (Dieta *)getDietaFromId: (int)idDieta;
- (NSMutableArray*)getAlimentosFromDieta: (int)idDieta;

- (void) limparBd;

@end
