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
