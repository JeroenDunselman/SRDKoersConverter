//
//  SRDKoersViewController.m
//  Koers
//
//  Created by Jeroen Dunselman on 23/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "SRDKoersViewController.h"
#import "SRDKoersTVC.h"

@interface SRDKoersViewController ()

@end

@implementation SRDKoersViewController
@synthesize vcTypeBankOfSTraat;

SRDKoersTVC *koersTVC;

//- (void)loadView
//{
//    // Create a view
////    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
////    
////    // Set it as *the* view of this view controller
////    self.view = backgroundView;
//    NSLog(@"loadView SRDKoersTVC");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    koersTVC = [[SRDKoersTVC alloc] init];
//                initWithNibName:@"SRDKoersTVC.h" bundle:nil];
    if ([self.vcTypeBankOfSTraat
         isEqualToString:@"straat"]) {
        self.lblStraatOfBank.text = @"STRAAT KOERSEN";
        koersTVC.vcTypeStraatOfBank = @"straat";
    } else {
        self.lblStraatOfBank.text = @"BANK KOERSEN";
        koersTVC.vcTypeStraatOfBank = @"bank";
    }
    self.lblStraatOfBank.font = [UIFont fontWithName:@"HelveticaNeue-SemiBold" size:17.0f];
    self.lblAdv.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17.0f];
    koersTVC.view.frame = self.tblView.bounds;
    [self addChildViewController:koersTVC];
    [self.tblView addSubview:koersTVC.view];
    [koersTVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
