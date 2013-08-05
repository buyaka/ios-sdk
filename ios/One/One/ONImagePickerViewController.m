//
//  ONImagePickerViewController.m
//  One
//
//  Created by Masakazu Ohtsuka on 2013/08/05.
//  Copyright (c) 2013年 KAYAC Inc. All rights reserved.
//

#import "ONImagePickerViewController.h"
#import "ONIconCell.h"

@interface ONImagePickerViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ONImagePickerViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    _iconButton.selected = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)iconButtonTouched:(id)sender {
}

- (IBAction)albumButtonTouched:(id)sender {
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LOG( @"selected: %@", indexPath );

    ONIconCell *cell = (ONIconCell*)[collectionView viewWithTag:indexPath.row+1];
    [UIView animateWithDuration:0.4
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         NSLog(@"animation start");
                         //[cell setBackgroundColor:[UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0]];
                         cell.imageView.alpha = 0.5;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"animation end");
                         //[cell setBackgroundColor:[UIColor whiteColor]];
                         cell.imageView.alpha = 1.0;
                     }
     ];

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    LOG_CURRENT_METHOD;
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LOG_CURRENT_METHOD;
    ONIconCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IconCell"
                                                                 forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed: @"icon.png"];
    cell.tag = indexPath.row + 1;
    return cell;
}

@end