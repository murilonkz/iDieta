//
//  Diet_Cell.h
//  iDieta
//
//  Created by Rafael Duarte on 17/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Diet_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblItem;
@property (weak, nonatomic) IBOutlet UILabel *lblAlarm;
@property (weak, nonatomic) IBOutlet UILabel *lblCal;

@end
