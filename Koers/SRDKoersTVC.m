//
//  SRDKoersTVC.m
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "SRDKoersTVC.h"
#import "SRDKoersHeaderCell.h"
#import "SRDAdvertentieCell.h"
#import "SRDKoersCell.h"

@interface SRDKoersTVC ()

@end

@implementation SRDKoersTVC
@synthesize vcTypeStraatOfBank;
NSArray* titleKeys;
UIColor *colorBlue;
UIColor *colorOranj;
UIColor *colorHome;

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([self.vcTypeStraatOfBank isEqualToString: @"straat"]) {
        self.tableView.backgroundColor = [UIColor blueColor];
    } else {
        self.tableView.backgroundColor = [UIColor greenColor];
    }
    colorHome = [UIColor colorWithRed:151.0f/255.0f green:186.0f/255.0f blue:106.0f/255.0f alpha:1.0f];
    
//    self.tableView.backgroundColor = colorHome; //[UIColor blueColor];
    colorBlue = [UIColor colorWithRed:0.0f/255.0f green:67.0f/255.0f blue:88.0f/255.0f alpha:1.0f];
    colorOranj = [UIColor colorWithRed:253.0f/255.0f green:116.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    //    [UIColor colorwithHexString:@"0A5CEA" alpha:.9];[UIColor colorWithRed:0.208 green:0.1 blue:0.1 alpha:0.5];
    
    /*
     // For registering nib files
     tableView.register(UINib(nibName: "MyCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
     
     // For registering classes
     tableView.register(MyCellClass.self, forCellReuseIdentifier: "cell")
     */
    
    [self.tableView registerClass:[SRDKoersCell class] forCellReuseIdentifier:@"koersValutaType"];
    [self.tableView registerClass:[SRDKoersHeaderCell class] forCellReuseIdentifier:@"koersHeader"];
    [self.tableView registerClass:[SRDAdvertentieCell class] forCellReuseIdentifier:@"koersAdvertentie"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDKoersCell" bundle:nil] forCellReuseIdentifier:@"koersValutaType"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDKoersHeaderCell" bundle:nil] forCellReuseIdentifier:@"koersHeader"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDAdvertentieCell" bundle:nil] forCellReuseIdentifier:@"koersAdvertentie"];
    //
    //    self.tableView.register[(UINib(nibName: "SRDKoersHeaderCell", bundle: Bundle.main), forCellReuseIdentifier: "koersHeader") ];
    
    titleKeys = [NSArray arrayWithObjects:
                 @"Koers.sr beta Dagkoers <datum>",
                 @"Aankoop Dollar",
                 @"Aankoop Euro",
                 @"Verkoop Dollar",
                 @"Verkoop Euro",
                 @"Advertentie",
                 nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat result;
    
    result = 100.0f;
    if (indexPath.row == 0  )
    {
        result = 120.0f;
    }
    if ( indexPath.row == [titleKeys count] - 1 )
    {
        result = 220.0f;
    }
    
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellType = @"";
    
    if (indexPath.row == 0) {
        cellType = @"koersHeader";
        SRDKoersHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
//        cell.textLabel.text = [titleKeys objectAtIndex:indexPath.row];
        return cell;
    }
    
    if (indexPath.row == [titleKeys count] - 1) {
        cellType = @"koersAdvertentie";
        SRDAdvertentieCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
//        cell.textLabel.text = [titleKeys objectAtIndex:indexPath.row];
        return cell;
    }
    
    cellType = @"koersValutaType";
    SRDKoersCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
//    cell.textLabel.text = [titleKeys objectAtIndex:indexPath.row];
    if (indexPath.row % 2 == 0) {
//        cell.textLabel.textColor = colorOranj;
        cell.bgValuta.backgroundColor = colorOranj;
    } else {
        cell.bgValuta.backgroundColor = colorBlue;
        //        cell.textLabel.textColor =  colorBlue;
    }

    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [titleKeys count];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
