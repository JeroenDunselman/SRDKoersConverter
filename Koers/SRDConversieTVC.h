//
//  SRDConversieTVC.h
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRDConversieCell.h"
//@interface SRDConversieTVC : UITableViewController <SRDConversieCellDelegate> 
@interface SRDConversieTVC : UITableViewController <SRDConversieCellDelegate, NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}
@property (nonatomic, strong) NSArray *dataFound;
@end
