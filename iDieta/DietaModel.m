//
//  DietaModel.m
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "DietaModel.h"

@implementation DietaModel

+ (DietaModel *)sharedModel
{
    static DietaModel *sharedModel = nil;
    
    if (!sharedModel)
        sharedModel = [[super alloc] init];
    
    return sharedModel;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *docsDir;
        NSArray *dirPaths;
        char *errMsg;
        BOOL BDExist;
        
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = dirPaths[0];
        
        _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"dieta.db"]];
        NSFileManager *filemgr = [NSFileManager defaultManager];
        BDExist = [filemgr fileExistsAtPath:_databasePath];
        
        const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
            if (BDExist == NO)
                NSLog(@"BD criado com sucesso");
            else
                NSLog(@"BD aberto com sucesso");
            
            // CRIA A TABELA ALIMENTOS
            const char *tblAlimentos = "CREATE TABLE IF NOT EXISTS alimentos (id_alimento INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, calorias REAL)";
            if (sqlite3_exec(_DB, tblAlimentos, NULL, NULL, &errMsg) != SQLITE_OK)
                NSLog(@"Falha ao criar a tabela alimentos");
            else
                NSLog(@"Tabela alimentos criada/aberta com sucesso");
            
            // CRIA A TABELA DIETAS
            const char *tblDietas = "CREATE TABLE IF NOT EXISTS dietas (id_dieta INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, calorias_diarias REAL)";
            if (sqlite3_exec(_DB, tblDietas, NULL, NULL, &errMsg) != SQLITE_OK)
                NSLog(@"Falha ao criar a tabela dietas");
            else
                NSLog(@"Tabela dietas criada/aberta com sucesso");
            
            
            // CRIA A TABELA DIETA_ALIMENTOS
            const char *tblDietaAlimentos = "CREATE TABLE IF NOT EXISTS dieta_alimentos (id_row INTEGER PRIMARY KEY AUTOINCREMENT, fk_id_alimento INTEGER, fk_id_dieta INTEGER, dia_semana TEXT, horario TEXT, FOREIGN KEY(fk_id_alimento) REFERENCES alimentos(id_alimento), FOREIGN KEY(fk_id_dieta) REFERENCES artist(id_dieta))";
            if (sqlite3_exec(_DB, tblDietaAlimentos, NULL, NULL, &errMsg) != SQLITE_OK)
                NSLog(@"Falha ao criar a tabela dieta_alimentos");
            else
                NSLog(@"Tabela dieta_alimentos criada/aberta com sucesso");
            
            
//            [self loadData];
            
            sqlite3_close(_DB);
        } else {
            NSLog(@"Falha ao criar/abrir o BD");
        }
    }
    return self;
}

- (BOOL) addDieta: (Dieta*)dieta
{
    char *errMsg;
    const char *dbpath = [_databasePath UTF8String];
    BOOL state;

    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO DIETAS (nome, calorias_diarias) VALUES (\"%@\", \"%lf\")", dieta.nome, dieta.caloriasDiarias];
        const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_exec(_DB, insert_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            state = NO;
        }
        else {
            state = YES;
        }
        sqlite3_close(_DB);
    } else {
        state = NO;
    }
    
    return state;

}

- (NSMutableArray *) getAllDietas
{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    NSMutableArray *dietas = [[NSMutableArray alloc]init];
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        const char *query_stmt = [@"SELECT id_dieta, nome, calorias_diarias FROM dietas ORDER BY nome" UTF8String];
        if (sqlite3_prepare_v2(_DB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                int idDieta = sqlite3_column_int(statement, 0);
                NSString *nome = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                float calorias_diarias = sqlite3_column_double(statement, 2);
                
                Dieta *dieta = [[Dieta alloc]init];
                [dieta setIdDieta: idDieta];
                [dieta setNome: nome];
                [dieta setCaloriasDiarias:calorias_diarias];
                
                [dietas addObject:dieta];
                
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DB);
    }
    
    return dietas;
}

- (BOOL) addAlimentos: (NSMutableArray*)alimentos naDietaId:(int)idDieta
{
    const char *dbpath = [_databasePath UTF8String];
    BOOL state = YES;
    char *errMsg;
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        for (int i = 0; i < alimentos.count; i++) {
            NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO dieta_alimentos (fk_id_alimento, fk_id_dieta, dia_semana, horario) VALUES (\"%i\", \"%i\", \"%@\", \"%@\")", [[alimentos objectAtIndex:i] idAlimento], idDieta, [[alimentos objectAtIndex:i]diaConsumo], [[alimentos objectAtIndex:i]horarioConsumo]];
            const char *insert_stmt = [insertSQL UTF8String];
            sqlite3_exec(_DB, insert_stmt, NULL, NULL, &errMsg);
        }
        sqlite3_close(_DB);
    } else {
        state = NO;
    }
    
    return state;
}

- (BOOL) removerAlimentoId: (int)idAlimento daDietaId:(int)idDieta
{
    const char *dbpath = [_databasePath UTF8String];
    BOOL state;
    char *errMsg;
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
            NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM dieta_alimentos WHERE fk_id_alimento = \"%i\", AND fk_id_dieta = \"%i\"", idAlimento, idDieta];
            const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_exec(_DB, insert_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            state = NO;
        }
        else {
            state = YES;
        }
        sqlite3_close(_DB);
    } else {
        state = NO;
    }
    
    return state;

}

- (BOOL) removerDietaId: (int)idDieta
{
    const char *dbpath = [_databasePath UTF8String];
    BOOL state = YES;
    char *errMsg;
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM dieta_alimentos WHERE fk_id_dieta = \"%i\"", idDieta];
        const char *delete_stmt = [deleteSql UTF8String];
        sqlite3_exec(_DB, delete_stmt, NULL, NULL, &errMsg);
        
        NSString *deleteSql2 = [NSString stringWithFormat:@"DELETE FROM dieta WHERE id_dieta = \"%i\"", idDieta];
        const char *delete_stmt2 = [deleteSql2 UTF8String];
        sqlite3_exec(_DB, delete_stmt2, NULL, NULL, &errMsg);
        
        sqlite3_close(_DB);
    } else {
        state = NO;
    }
    
    return state;
}

- (Dieta *)getDietaFromId: (int)idDieta
{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    Dieta * dieta = [[Dieta alloc]init];
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        const char *query_stmt = [@"SELECT id_dieta, nome, calorias_diarias FROM dietas WHERE id_dieta = \"%i\"" UTF8String];
        if (sqlite3_prepare_v2(_DB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                int idDieta = sqlite3_column_int(statement, 0);
                NSString *nome = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                float calorias_diarias = sqlite3_column_double(statement, 2);
                
                [dieta setIdDieta: idDieta];
                [dieta setNome: nome];
                [dieta setCaloriasDiarias:calorias_diarias];
                
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DB);
    }
    return dieta;
}

- (NSMutableArray*)getAlimentosFromDieta: (int)idDieta
{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    NSMutableArray *alimentos = [[NSMutableArray alloc]init];
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        

        NSString *querySQL = [NSString stringWithFormat:@"SELECT a.id_alimento, a.nome, a.calorias, da.dia_semana, da.horario FROM alimentos AS a JOIN dieta_alimentos AS da ON a.id_alimento = da.fk_id_alimento WHERE da.fk_id_dieta = \"%i\"", idDieta];
        
        
        const char *select_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_DB, select_stmt, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                int idAlimento = sqlite3_column_int(statement, 0);
                NSString *nome = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                float calorias = sqlite3_column_double(statement, 2);
                NSString *dia = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                NSString *horario = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                
                
                Alimento *alimento = [[Alimento alloc]init];
                [alimento setIdAlimento: idAlimento];
                [alimento setNome: nome];
                [alimento setCalorias:calorias];
                [alimento setDiaConsumo: dia];
                [alimento setHorarioConsumo: horario];

                
                [alimentos addObject:alimento];
                
            }
            sqlite3_finalize(statement);
        }
        else {
            NSLog(@"ERRO");
        }
        sqlite3_close(_DB);
    }
    
    return alimentos;
}


- (void) limparBd
{
    const char *dbpath = [_databasePath UTF8String];

    char *errMsg;
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        
        
        NSString *querySQL = [NSString stringWithFormat:@"DELETE FROM dietas WHERE id_dieta > 0"];
        const char *select_stmt = [querySQL UTF8String];
        if (sqlite3_exec(_DB, select_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            NSLog(@"Erro ao limpar a tabela dietas");
        }
        
        NSString *querySQL2 = [NSString stringWithFormat:@"DELETE FROM alimentos WHERE id_alimento > 0"];
        const char *select_stmt2 = [querySQL2 UTF8String];
        if (sqlite3_exec(_DB, select_stmt2, NULL, NULL, &errMsg) != SQLITE_OK) {
            NSLog(@"Erro ao limpar a tabela alimentos");
        }
        
        NSString *querySQL3 = [NSString stringWithFormat:@"DELETE FROM dieta_alimentos WHERE id_row > 0"];
        const char *select_stmt3 = [querySQL3 UTF8String];
        if (sqlite3_exec(_DB, select_stmt3, NULL, NULL, &errMsg) != SQLITE_OK) {
            NSLog(@"Erro ao limpar a tabela dieta_alimentos");
        }
        
        sqlite3_close(_DB);
    }

    
}


-(BOOL) existsDiets
{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    BOOL tblOk;
    
    tblOk=NO;
    
    
    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
        const char *query_stmt = [@"SELECT COUNT(*) FROM dietas;" UTF8String];
        if (sqlite3_prepare_v2(_DB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            tblOk=sqlite3_column_int(statement, 0);
                //            while (sqlite3_step(statement) == SQLITE_ROW) {
                //
                //                int idDieta = sqlite3_column_int(statement, 0);
                //                NSString *nome = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                //                float calorias_diarias = sqlite3_column_double(statement, 2);
                //
                //                Dieta *dieta = [[Dieta alloc]init];
                //                [dieta setIdDieta: idDieta];
                //                [dieta setNome: nome];
                //                [dieta setCaloriasDiarias:calorias_diarias];
                //
                //                [dietas addObject:dieta];
                //                
                //            }
                //            sqlite3_finalize(statement);
        }
        sqlite3_close(_DB);
    }
    
    return tblOk;
}





@end
