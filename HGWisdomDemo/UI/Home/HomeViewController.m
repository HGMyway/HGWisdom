//
//  HomeViewController.m
//  HGWisdomDemo
//
//  Created by 小雨很美 on 2017/9/10.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "HomeViewController.h"
#import "UIImage+color.h"
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.image.image = [UIImage imageWithColor:[UIColor redColor] andAlpha:0.5 ];

//	self.image.image = [UIImage createImageWithColor:[UIColor redColor]];

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
