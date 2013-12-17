//
//  NewDietViewController.h
//  iDieta
//
//  Created by Rafael Duarte on 17/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDietViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtCal;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@end
