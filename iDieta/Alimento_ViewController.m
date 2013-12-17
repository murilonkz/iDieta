//
//  Alimento_ViewController.m
//  iDieta
//
//  Created by Rafael Duarte on 17/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Alimento_ViewController.h"

@interface Alimento_ViewController ()

@end

@implementation Alimento_ViewController
@synthesize txtAlimento,txtCalorias,datePicker,btnSalvar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ClickSalvar:(id)sender {
    NSString *alimento;
    double cal;
    NSDate *alarm;
    
    alimento=txtAlimento.text;
    cal=[txtCalorias.text doubleValue];
        //alarm=[datePicker.date];
    
    txtAlimento.text=@"";
    txtCalorias.text=@"";
    
    
    [btnSalvar setEnabled:NO];
    
        //RECORD THE NEW DIET TO DB
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Alimento adicionado"
                              message:alimento
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
    
    alertView.alertViewStyle = UIAlertViewStyleDefault;
    [alertView show];
    
    
}

- (IBAction)TouchUpOutside:(id)sender {
    [self.view endEditing:YES];
}


- (IBAction)ChangedItem:(id)sender {
    if (!(([txtAlimento.text isEqual:@""])||([txtCalorias.text isEqual:@""])))
        {[btnSalvar setEnabled:YES];}
    else{
        {[btnSalvar setEnabled:NO];}
    };
}

- (IBAction)ChangedCal:(id)sender {
    if (!(([txtAlimento.text isEqual:@""])||([txtCalorias.text isEqual:@""])))
        {[btnSalvar setEnabled:YES];}
    else{
        {[btnSalvar setEnabled:NO];}
    };
    
}




@end



