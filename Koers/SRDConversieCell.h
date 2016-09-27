//
//  SRDConversieCell.h
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSCurrencyTextField.h"

@protocol SRDConversieCellDelegate;
@interface SRDConversieCell : UITableViewCell
{id<SRDConversieCellDelegate> cellDelegate;}
@property (nonatomic, assign) id<SRDConversieCellDelegate> cellDelegate;

- (IBAction)changeVal:(id)sender;
@property (weak, nonatomic) IBOutlet TSCurrencyTextField *valueEdited;
@property (weak, nonatomic) IBOutlet UITextField *txtValutaType;
@property (weak, nonatomic) IBOutlet UILabel *resultLbl;
@property NSString *valutaType;
@end
@protocol SRDConversieCellDelegate <NSObject>
//- (void)getPhoto;
-(void)changedToValue:(NSNumber *)val forValutaType:()valutaType;
@end