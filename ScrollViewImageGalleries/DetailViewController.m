//
//  DetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Steve on 2015-09-07.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (strong, nonatomic) UIImageView *detailImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailImageView = [[UIImageView alloc] init];
    
    self.detailImageView.image = self.image;
    
    self.detailImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.detailScrollView addSubview:self.detailImageView];
    
    self.detailScrollView.delegate = self;
    self.detailScrollView.minimumZoomScale = 1.0;
    self.detailScrollView.maximumZoomScale = 4.0;
    self.detailScrollView.zoomScale = 1.0;
    
    // Set Up Constraints
    NSLayoutConstraint *detailTop = [NSLayoutConstraint constraintWithItem:self.detailImageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.detailScrollView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:0];
    
    NSLayoutConstraint *detailLeft = [NSLayoutConstraint constraintWithItem:self.detailImageView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.detailScrollView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:0];
    
    NSLayoutConstraint *detailRight = [NSLayoutConstraint constraintWithItem:self.detailImageView
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.detailScrollView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0];
    
    NSLayoutConstraint *detailBottom = [NSLayoutConstraint constraintWithItem:self.detailImageView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.detailScrollView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:0];
    
    [self.detailScrollView addConstraint:detailTop];
    [self.detailScrollView addConstraint:detailLeft];
    [self.detailScrollView addConstraint:detailRight];
    [self.detailScrollView addConstraint:detailBottom];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.detailImageView;
}

@end
