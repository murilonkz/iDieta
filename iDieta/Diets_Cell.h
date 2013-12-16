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
@property (nonatomic)int pk;

-(void)setPk:(int)pk;

@end
