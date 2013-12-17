//
//  Alimento_ViewController.h
//  iDieta
//
//  Created by Rafael Duarte on 17/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alimento_ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtAlimento;
@property (weak, nonatomic) IBOutlet UITextField *txtCalorias;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
