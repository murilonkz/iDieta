//
//  AppDelegate.m
//  iDieta
//
//  Created by Murilo Campaner on 07/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "AppDelegate.h"
#import "Start_ViewController.h"
#import "Diets_ViewController.h"
#import "DietaModel.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //testegugyugyu
    /*
    IndexViewController *ivc = [[IndexViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:ivc];
    

    self.window.rootViewController = navigationController;
    */
    
    //Comments
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
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:[[Diets_ViewController alloc] initWithNibName:@"Diets_ViewController" bundle:nil]];
    [[self window]setRootViewController:navigationController];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.7f alpha:1.0f]];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
