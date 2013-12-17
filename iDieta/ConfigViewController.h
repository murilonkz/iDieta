//
//  ConfigViewController.h
//  iDieta
//
//  Created by Thiago Oliveira on 12/17/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigViewController : UIViewController
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchLunch;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;

@end
