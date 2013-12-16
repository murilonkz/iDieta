//
//  Diets_ViewController.m
//  iDieta
//
//  Created by Rafael Duarte on 15/12/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "Diets_ViewController.h"
#import "Diet_ViewController.h"
#import "Diet.h"
#import "Diets_Cell.h"
#import "Item.h"

@interface Diets_ViewController ()
{
    Diet_ViewController *dietView;
}
@end


@implementation Diets_ViewController
@synthesize view;

- (id)init
{
    self = [super init];
    if (self) {
        
        [self setTitle:@"Dietas"];
        dietView=[[Diet_ViewController alloc]init];
        
        [[NSBundle mainBundle] loadNibNamed:@"Diets_ViewController" owner:self options:nil];
        [self.tableView setTableHeaderView:[self view]];
        
        UINib *cel = [UINib nibWithNibName:@"Diet_Cell" bundle:nil];
        [self.tableView registerNib:cel forCellReuseIdentifier:@"Diet_Cell"];
    }
    return self;
}


//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        
//        [self setTitle:@"Dieta"];
//        dietView=[[Diet_ViewController alloc]init];
//        
//        [[NSBundle mainBundle] loadNibNamed:@"Diets_ViewController" owner:self options:nil];
//        [self.tableView setTableHeaderView:[self view]];
//        
//        
//        UINib *cel = [UINib nibWithNibName:@"Diets_Cell" bundle:nil];
//        [self.tableView registerNib:cel forCellReuseIdentifier:@"Diets_Cell"];
//    }
//    return self;
//}




- (void)viewDidLoad
{
    [super viewDidLoad];

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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[Diet sharedDiet]itens]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Diets_Cell";
    
    Diets_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Item *item = [[[Diet sharedDiet]itens]objectAtIndex:[indexPath row]];
    
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


 // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}
//{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Item *item = [[[Diet sharedDiet]itens] objectAtIndex:indexPath.row];
        [[Diet sharedDiet] RemoveItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[Diet sharedDiet]moveItemFrom:fromIndexPath.row To:toIndexPath.row];
}



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
