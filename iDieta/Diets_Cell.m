//
//  Diets_Cell.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Diets_Cell.h"
#import "Diet_ViewController.h"

@implementation Diets_Cell
@synthesize button=_button;
@synthesize sw=_sw;
@synthesize pk=_pk;
@synthesize name=_name;
@synthesize isEnabled=_isEnabled;
@synthesize navCtrl=_navCtrl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
            // Initialization code
    }
    return self;
}


//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//            // Initialization code
//    }
//    return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellPk:(int)pk Name:(NSString*)name isEnabled:(BOOL)enabled NavCntrl:(UINavigationController*)navCtrl{
    _pk=pk;
    _name=name;
    _isEnabled=enabled;
    _navCtrl=navCtrl;
    
    [_button setTitle:name forState:UIControlStateNormal];
    [_sw setSelected:enabled];
}
- (IBAction)SelectDiet:(id)sender {
    Diet_ViewController *dietView=[[Diet_ViewController alloc]init];
    [dietView SetPk:_pk];
    [dietView setTitle:_name];
    
    [_navCtrl pushViewController:dietView animated:YES];
    
}
- (IBAction)EnabledStatusChange:(id)sender {
}



@end
