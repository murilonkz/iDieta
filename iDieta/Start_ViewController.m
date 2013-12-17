//
//  Start_ViewController.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Start_ViewController.h"
#import "Diets_ViewController.h"
#import "Schedule_ViewController.h"
#import "Lunchbox_ViewController.h"
#import "Dieta.h"
#import "DietaModel.h"

@interface Start_ViewController ()
{
    Diets_ViewController    *dietsView;
    Schedule_ViewController *scheduleView;
    Lunchbox_ViewController *lunchboxView;
}
@end




@implementation Start_ViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Início"];
        dietsView=[[Diets_ViewController alloc]init];
        scheduleView=[[Schedule_ViewController alloc]init];
        lunchboxView=[[Lunchbox_ViewController alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DietaModel *sharedModel = [DietaModel sharedModel];
    
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




- (IBAction)btnDietas:(id)sender {
    [self.navigationController pushViewController:dietsView animated:YES];
}

- (IBAction)btnAgenda:(id)sender {
    [self.navigationController pushViewController:scheduleView animated:YES];
}

- (IBAction)btnLancheira:(id)sender {
    [self.navigationController pushViewController:lunchboxView animated:YES];
}

- (IBAction)btnSobre:(id)sender {
}

@end
