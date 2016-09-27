//
//  SRDConversie.h
//  Koers
//
//  Created by Jeroen Dunselman on 23/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRDConversie : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *valueFrom;
@property (weak, nonatomic) IBOutlet UITextField *valueTo;
@end
