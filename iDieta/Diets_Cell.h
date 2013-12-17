//
//  Diets_Cell.h
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Diets_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UISwitch *sw;

@property (nonatomic)int pk;
@property(strong,nonatomic)NSString*name;
@property(nonatomic)BOOL isEnabled;

@property(strong,nonatomic)UINavigationController*navCtrl;

-(void)setCellPk:(int)pk Name:(NSString*)name isEnabled:(BOOL)enabled NavCntrl:(UINavigationController*)navCtrl;

@end
