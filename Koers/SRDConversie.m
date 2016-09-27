//
//  SRDConversie.m
//  Koers
//
//  Created by Jeroen Dunselman on 23/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "SRDConversie.h"

@interface SRDConversie ()

@end

@implementation SRDConversie

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.valueTo.delegate = self;
    self.valueFrom.delegate = self;
    self.valueFrom.keyboardType=UIKeyboardTypeDecimalPad;
    self.valueTo.keyboardType=UIKeyboardTypeDecimalPad;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //wtf
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.valueTo] == YES)
    {
        [self.valueTo resignFirstResponder];
    }
//    {
//        [self.secondField becomeFirstResponder];
//    }
//    else
//    {
//        [self.secondField resignFirstResponder];
//    }
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
