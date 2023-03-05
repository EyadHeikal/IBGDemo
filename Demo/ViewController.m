//
//  ViewController.m
//  Demo
//
//  Created by Eyad on 30/08/2022.
//

#import "ViewController.h"
#import "Instabug/Instabug.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSUserDefaults.standardUserDefaults setValue:@"IBGValue" forKey:@"IBGKey"];
}


@end
