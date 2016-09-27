//
//  SRDKoersViewController.h
//  Koers
//
//  Created by Jeroen Dunselman on 23/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRDKoersViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *tblView;
@property (weak, nonatomic) IBOutlet UILabel *lblStraatOfBank;
@property NSString *vcTypeBankOfSTraat;
@property (weak, nonatomic) IBOutlet UILabel *lblAdv;
@end
