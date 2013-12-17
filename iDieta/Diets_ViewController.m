    //
    //  Diets_ViewController.m
    //  iDieta
    //
    //  Created by Thiago Oliveira on 12/16/13.
    //  Copyright (c) 2013 Murilo Campaner. All rights reserved.
    //

#import "Diets_ViewController.h"
#import "DietaModel.h"
#import "Diets_Cell.h"
#import "ConfigViewController.h"
#import "NewDietViewController.h"
#import "Diet_ViewController.h"


@interface Diets_ViewController ()
{
    Diet_ViewController    *dietView;
}

@end

@implementation Diets_ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        
        UINib *cel = [UINib nibWithNibName:@"Diets_Cell" bundle:nil];
        [self.tableView registerNib:cel forCellReuseIdentifier:@"Diets_Cell"];
        
    }
    return self;
}

- (IBAction)novaView:(id)sender
{
    NSLog(@"foi");
    NewDietViewController *newView=[[NewDietViewController alloc]init];
    [self.navigationController pushViewController:newView animated:YES];
//    ThirdViewController *third = [[ThirdViewController alloc]init];
//    [self.navigationController pushViewController:third animated:YES];
}

- (IBAction)configView:(id)sender
{
    NSLog(@"foi");
    ConfigViewController *conf = [[ConfigViewController alloc]init];
    [self.navigationController pushViewController:conf animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Dietas"];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Nova" style:UIBarButtonItemStylePlain target:self action:@selector(novaView:)];
    [self.navigationItem setRightBarButtonItem:next];
    
    UIBarButtonItem *last = [[UIBarButtonItem alloc] initWithTitle:@"Config" style:UIBarButtonItemStylePlain target:self action:@selector(configView:)];
    [self.navigationItem setLeftBarButtonItem:last];
    DietaModel *sharedModel = [DietaModel sharedModel];
    _dietas = [sharedModel getAllDietas];
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        // Return the number of rows in the section.

    return _dietas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
        // Configure the cell...
    [[cell textLabel]setText:[[_dietas objectAtIndex:[indexPath row]]nome]];
    
    return cell;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Diets_Cell";
//    Diets_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    if (cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
////    }
//    
//        // Configure the cell...
//        [[cell textLabel]setText:[[_dietas objectAtIndex:[indexPath row]]nome]];
//        //[cell setCellPk:[indexPath row] Name:[[_dietas objectAtIndex:[indexPath row]]nome] isEnabled:YES NavCntrl:self.navigationController];
//    return cell;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Diets_Cell";
//    
//    Diets_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    [cell setPk:[indexPath row]];
//    [cell setCellPk:[indexPath row] Name:[NSString stringWithFormat:@"Dieta numero %d",arc4random()%50] isEnabled:arc4random()%2 NavCntrl:self.navigationController];
//    
//    return cell;
//}








/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 //DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 // [self.navigationController pushViewController:detailViewController animated:YES];
 }


@end
