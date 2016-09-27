//
//  SRDConversieTVC.m
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "SRDConversieTVC.h"
#import "SRDKoersHeaderCell.h"
#import "SRDAdvertentieCell.h"
#import "SRDConversieCell.h"

@interface SRDConversieTVC ()

@end

@implementation SRDConversieTVC
NSArray* valutaKeys;
NSMutableArray* valutaValues;
NSArray* valutaRatioToSRD;
NSMutableArray *test;
NSString *editingValutaType;
UIColor *colorBlu;
UIColor *colorOrang;

- (void)changedToValue:(NSNumber *)val forValutaType:(NSString *)valutaType {
    editingValutaType = valutaType;
    int indexOfCurrentTypeInKeys = [valutaKeys indexOfObjectIdenticalTo:valutaType];
    NSNumber *ratioOfCurrentType = [valutaRatioToSRD objectAtIndex:indexOfCurrentTypeInKeys];
    float ratioToBaseValuta = 1/ratioOfCurrentType.floatValue;

    
    NSLog(@"val: %@, editingValutaType: %@", val, editingValutaType);

    for (int i = 0; i < [valutaKeys count]; i++) {
//        if ([valutaKeys[i] isEqualToString: editingValutaType]) {
//            float y = val.floatValue;
//            NSNumber *x = [[NSNumber alloc] initWithFloat: y];
//            valutaValues[i] = x;
//        } else  {
            float ratio = [[valutaRatioToSRD objectAtIndex:i] floatValue];
            float y = val.floatValue * ratio * ratioToBaseValuta;
            
            NSNumber *x = [[NSNumber alloc] initWithFloat: y];
            valutaValues[i] = x; //@(8);
//        }
//        NSLog(@"%f", y);
    }
    [self.tableView reloadData];
    //        valutaValues[i] =
    //        NSNumber *x = @(3) * @(2); // ratio * val;
    //        int x = 3.0f * 2.4f;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    valutaKeys = [NSArray arrayWithObjects:
                 @"SRD", @"USD", @"EUR",
                 nil];
    valutaRatioToSRD = [NSArray arrayWithObjects:
                    @(1), @(0.75f), @(0.45f),
                    nil];
    valutaValues = [NSMutableArray arrayWithObjects:
                    @(1), @(0.75f), @(0.45f),
                    nil];
    
    colorOrang = [UIColor colorWithRed:253.0f/255.0f green:116.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    colorBlu =
    [UIColor colorWithRed:0.0f/255.0f green:67.0f/255.0f blue:88.0f/255.0f alpha:1.0f];
    
    
    [self.tableView registerClass:[SRDConversieCell class] forCellReuseIdentifier:@"conversieCell"];
    [self.tableView registerClass:[SRDKoersHeaderCell class] forCellReuseIdentifier:@"conversieHeader"];
    [self.tableView registerClass:[SRDAdvertentieCell class] forCellReuseIdentifier:@"conversieAdvertentie"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDKoersHeaderCell" bundle:nil] forCellReuseIdentifier:@"conversieHeader"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDAdvertentieCell" bundle:nil] forCellReuseIdentifier:@"conversieAdvertentie"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SRDConversieCell" bundle:nil] forCellReuseIdentifier:@"conversieCell"];
    
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellType = @"";
    
    if (indexPath.row == 0) {
        cellType = @"conversieHeader";
        SRDKoersHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.row == 4) {
        cellType = @"conversieAdvertentie";
        SRDAdvertentieCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
        return cell;
    }
    
    //    cellType = @"myCellReuseId";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
    ////    cell.textLabel.text = [titleKeys objectAtIndex:indexPath.row];
    //    if (indexPath.row % 2 == 0) {
    //        cell.textLabel.textColor = colorOranj;
    //    } else {
    //        cell.textLabel.textColor =  colorBlue;
    //    }
    SRDConversieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"conversieCell" forIndexPath:indexPath];
    float cellVal = [[valutaValues objectAtIndex:indexPath.row - 1] floatValue];
    NSString *result =
    [[NSString alloc] initWithFormat:@"%f", cellVal];
    //    NSLog(@"%@", result);
    [cell.resultLbl setText:result];
    [cell.txtValutaType setText:[valutaKeys objectAtIndex: (long)indexPath.row - 1]];
    cell.valutaType = [valutaKeys objectAtIndex: (long)indexPath.row - 1];//[[NSString alloc] initWithFormat:@"%ld", (long)indexPath.row];
    
    [cell.valueEdited.currencyNumberFormatter setCurrencySymbol:cell.valutaType ];
//    [cell.valueEdited setText:result];
    NSNumber *amt = [[NSNumber alloc] initWithFloat:cellVal];
    [cell.valueEdited setAmount:amt];
    cell.cellDelegate = self;
    if ([cell.valutaType isEqualToString: editingValutaType]) {
        [cell.valueEdited becomeFirstResponder];
    }
   
    //    [cell. addTarget:self
    //                        action:@selector(getPhoto)
    //              forControlEvents:UIControlEventTouchUpInside];
    
    //;
    //    if (indexPath.row % 2 == 0) {
    //        cell.backgroundColor = colorOrang;
    //    } else {
    //        cell.backgroundColor =  colorBlu;
    //    }
    // Configure the cell...
    
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
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat result;
    
    result = 64.0f;
    if (indexPath.row == 0  )
    {
        result = 120.0f;
    }
    if ( indexPath.row == 4 )
    {
        result = 220.0f;
    }
    
    return result;
}




//- (void)getPhoto {
//
//    NSLog(@"getphoto");
//}
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2 == 0){
//        cell.backgroundColor = [UIColor blueColor];
//    } else {
//        cell.backgroundColor = [UIColor whiteColor];
//    }
//}

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
