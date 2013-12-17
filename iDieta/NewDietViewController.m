//
//  NewDietViewController.m
//  iDieta
//
//  Created by Rafael Duarte on 17/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "NewDietViewController.h"

@interface NewDietViewController ()

@end

@implementation NewDietViewController
@synthesize txtCal,txtName,btnSave;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Nova Dieta"];
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


- (IBAction)clickSave:(id)sender {
    NSString *name;
    double cal;
    
    name=txtName.text;
    cal=[txtCal.text doubleValue];
    
    txtName.text=@"";
    txtCal.text=@"";
    
    [btnSave setEnabled:NO];
    
//RECORD THE NEW DIET TO DB
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"DIETA ADICIONADA"
                                    message:@""
                                    delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
    
    alertView.alertViewStyle = UIAlertViewStyleDefault;
    [alertView show];
    
    
}

- (IBAction)ChangedName:(id)sender {
    if (!(([txtName.text isEqual:@""])||([txtCal.text isEqual:@""])))
        {[btnSave setEnabled:YES];}
    else{
        {[btnSave setEnabled:NO];}
    };
}


- (IBAction)ChangedCal:(id)sender {
    if (!(([txtName.text isEqual:@""])||([txtCal.text isEqual:@""])))
        {[btnSave setEnabled:YES];}
    else{
        {[btnSave setEnabled:NO];}
    };
}














@end
