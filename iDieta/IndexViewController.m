//
//  IndexViewController.m
//  iDieta
//
//  Created by Murilo Campaner on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "IndexViewController.h"
#import "Dieta.h"
#import "Alimento.h"
#import "DietaModel.h"
@interface IndexViewController ()

@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"Nova Dieta" style:UIBarButtonItemStylePlain target:self action:@selector(loadViewNovaDieta:)];
        
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"Config" style:UIBarButtonItemStylePlain target:self action:@selector(loadViewConfig:)];
        
        [self.navigationItem setRightBarButtonItem:right];
        [self.navigationItem setLeftBarButtonItem:left];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*
     - (BOOL) addDieta: (Dieta*)dieta;
     - (NSMutableArray*)getAllDietas;
     - (BOOL) addAlimentos: (NSMutableArray*)alimentos naDietaId:(int)idDieta;
     - (BOOL) removerAlimentoId: (int)idAlimento daDietaId:(int)idDieta;
     - (BOOL) removerDietaId: (int)idDieta;
     - (Dieta *)getDietaFromId: (int)idDieta;
     - (NSMutableArray*)getAlimentosFromDieta: (int)idDieta;
     */
    
    DietaModel *sharedModel = [[DietaModel alloc]init];
    
    // Limpa todas as tabelas do BD
    [sharedModel limparBd];
    
    // Adiciona duas novas dietas
    Dieta *dieta = [[Dieta alloc]init];
    [dieta setNome:@"Dieta1"];
    [dieta setCaloriasDiarias:1500];
    
    Dieta *dieta2 = [[Dieta alloc]init];
    [dieta2 setNome:@"Dieta2"];
    [dieta2 setCaloriasDiarias:2000];

    [sharedModel addDieta:dieta];
    [sharedModel addDieta: dieta2];
    
    // Busca todas as dietas
    NSMutableArray *allDietas = [sharedModel getAllDietas];
    
    NSLog(@"- Dietas Cadastradas: %d", allDietas.count);
    NSLog(@"- Nome e Calorias de Cada dieta:");
    for (int i = 0; i < allDietas.count; i++) {
        NSLog(@"(%i) %@ - %lf calorias", [[allDietas objectAtIndex:i]idDieta], [[allDietas objectAtIndex:i]nome], [[allDietas objectAtIndex:i]caloriasDiarias]);
    }
    
    // Adiciona alimentos à primeira dieta
    Alimento *alimento = [[Alimento alloc]init];
    [alimento setDiaConsumo:@"Segunda-Feira"];
    [alimento setNome:@"Banana"];
    [alimento setHorarioConsumo:@"09:00"];
    [alimento setCalorias:80];
    
    Alimento *alimento2 = [[Alimento alloc]init];
    [alimento2 setDiaConsumo:@"Terça-Feira"];
    [alimento2 setNome:@"Maçã"];
    [alimento2 setHorarioConsumo:@"16:00"];
    [alimento2 setCalorias:80];
    
    Alimento *alimento3 = [[Alimento alloc]init];
    [alimento3 setDiaConsumo:@"Segunda-Feira"];
    [alimento3 setNome:@"Pera"];
    [alimento3 setHorarioConsumo:@"10:00"];
    [alimento3 setCalorias:80];
    
    NSMutableArray *alimentosDieta = [[NSMutableArray alloc]initWithObjects:alimento, alimento2, alimento3, nil];
    
    [sharedModel addAlimentos:alimentosDieta naDietaId: 0];
    
    // Mostra os alimentos de cada dieta
    
    NSMutableArray *alimentosDiet = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < allDietas.count; i++)
    {
        alimentosDiet = [sharedModel getAlimentosFromDieta: [[allDietas objectAtIndex:i]idDieta] ];
        
        for (int j = 0; j < alimentosDiet.count; j++) {
            NSLog(@"- Alimento %i da dieta %i", [[alimentosDiet objectAtIndex:j]idAlimento], [[allDietas objectAtIndex:i]idDieta]);
            NSLog(@"%@, comer na %@ às %@ horas. (%f calorias)", [[alimentosDiet objectAtIndex:j]nome], [[alimentosDiet objectAtIndex:j]diaConsumo], [[alimentosDiet objectAtIndex: j]horarioConsumo], [[alimentosDiet objectAtIndex:j]calorias]);
        }
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadViewNovaDieta:(id)sender
{
    NSLog(@"Nova Dieta");
  //    FreteViewController *frete = [[FreteViewController alloc]init];
  //  [self.navigationController pushViewController:frete animated:YES];
}

- (IBAction)loadViewConfig:(id)sender
{
    NSLog(@"CONFIG");
    //    FreteViewController *frete = [[FreteViewController alloc]init];
    //  [self.navigationController pushViewController:frete animated:YES];
}

@end
