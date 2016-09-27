//
//  TabBarController.m
//  poq2 layout experiment
//
//  Created by Jeroen Dunselman on 29/01/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//      @"Attention", @"Test", @"localizablekey5",
    NSArray* titleKeys = [NSArray arrayWithObjects:
//                          @"Test",
                          @"Straat",
                          @"Bank",
                          @"Conversie",
                          @"Info",
                          nil];
    NSArray* imgKeys = [NSArray arrayWithObjects:
//                        @"Attention",
                        @"Road", @"Library", @"Currency", @"Attention",
                          nil];
    [super viewWillAppear:animated];
    int count = 0; for (UIViewController* viewController in self.viewControllers){
        viewController.tabBarItem.title = NSLocalizedString([titleKeys objectAtIndex:count], nil);
        NSString *t = [imgKeys objectAtIndex:count++];
        viewController.tabBarItem.image = [UIImage imageNamed:t];
//        NSLog(@"%@", t);
     //                                           [imgKeys objectAtIndex:count++]];
    }
//    [[self.tabBar appearance] setBarTintColor:[UIColor redColor]];
    
}

//-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
////    UIViewController* viewController = [self.viewControllers objectAtIndex:0];
////    viewController.tabBarItem.image = [UIImage imageNamed:@"chat.png"];
//
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    float fctr = 1.65f;
    CGFloat tabSize = fctr * 44.0;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        tabSize = fctr * 32.0;
    }
    
    CGRect tabFrame = self.tabBar.frame;
    
    tabFrame.size.height = tabSize;
    
    tabFrame.origin.y = self.view.frame.origin.y;
    
    self.tabBar.frame = tabFrame;
    
    // Set the translucent property to NO then back to YES to
    // force the UITabBar to reblur, otherwise part of the
    // new frame will be completely transparent if we rotate
    // from a landscape orientation to a portrait orientation.
    
    self.tabBar.translucent = NO;
    self.tabBar.translucent = YES;
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
