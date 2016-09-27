//
//  SRDKoersCell.h
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRDKoersCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgValuta;
@property (weak, nonatomic) IBOutlet UILabel *hdr;
@property (weak, nonatomic) IBOutlet UILabel *val;
@property (weak, nonatomic) IBOutlet UILabel *perc;

@end
