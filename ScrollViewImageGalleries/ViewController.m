//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Steve on 2015-09-07.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
- (IBAction)tapped:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    UIImageView *LHIn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    UIImageView *LHNight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *LH = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    
    LHIn.userInteractionEnabled = YES;
    LHNight.userInteractionEnabled = YES;
    LH.userInteractionEnabled = YES;
    
    LHIn.contentMode = UIViewContentModeScaleAspectFill;
    LHNight.contentMode = UIViewContentModeScaleAspectFill;
    LH.contentMode = UIViewContentModeScaleAspectFill;
    
    LHIn.clipsToBounds = YES;
    LHNight.clipsToBounds = YES;
    LH.clipsToBounds = YES;
    
    LHIn.translatesAutoresizingMaskIntoConstraints = NO;
    LHNight.translatesAutoresizingMaskIntoConstraints = NO;
    LH.translatesAutoresizingMaskIntoConstraints = NO;
    
//    [self.scrollView insertSubview:LHIn atIndex:0];
//    [self.scrollView insertSubview:LHNight atIndex:0];
//    [self.scrollView insertSubview:LH atIndex:0];
    
    
    
    [self.scrollView addSubview:LHIn];
    [self.scrollView addSubview:LHNight];
    [self.scrollView addSubview:LH];
    
//    [self.view bringSubviewToFront:self.pageView];
    
    // Set Up constraints
    
    NSLayoutConstraint *LHInTop = [NSLayoutConstraint constraintWithItem:LHIn
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.scrollView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:0];
    
    NSLayoutConstraint *LHInLeft = [NSLayoutConstraint constraintWithItem:LHIn
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1
                                                                 constant:0];

    NSLayoutConstraint *LHInBottom = [NSLayoutConstraint constraintWithItem:LHIn
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.scrollView
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1
                                                                   constant:0];
    
    NSLayoutConstraint *LHInWidth = [NSLayoutConstraint constraintWithItem:LHIn
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.scrollView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0];
    
    NSLayoutConstraint *LHInHeight = [NSLayoutConstraint constraintWithItem:LHIn
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.scrollView
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0];
    
    [self.scrollView addConstraint:LHInBottom];
    [self.scrollView addConstraint:LHInLeft];
//    [self.scrollView addConstraint:LHInRight];
    [self.scrollView addConstraint:LHInTop];
    [self.scrollView addConstraint:LHInWidth];
    [self.scrollView addConstraint:LHInHeight];
    
    NSLayoutConstraint *LHNightTop = [NSLayoutConstraint constraintWithItem:LHNight
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.scrollView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:0];
    
    NSLayoutConstraint *LHNightLeft = [NSLayoutConstraint constraintWithItem:LHNight
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:LHIn
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1
                                                                    constant:0];

    NSLayoutConstraint *LHNightWidth = [NSLayoutConstraint constraintWithItem:LHNight
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.scrollView
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1
                                                                     constant:0];
    
    NSLayoutConstraint *LHNightHeight = [NSLayoutConstraint constraintWithItem:LHNight
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.scrollView
                                                                     attribute:NSLayoutAttributeHeight
                                                                    multiplier:1
                                                                      constant:0];
    
    //    [self.scrollView addConstraint:LHInBottom];
    [self.scrollView addConstraint:LHNightTop];
    //    [self.scrollView addConstraint:LHInRight];
    [self.scrollView addConstraint:LHNightLeft];
    [self.scrollView addConstraint:LHNightWidth];
    [self.scrollView addConstraint:LHNightHeight];
    
    NSLayoutConstraint *LHTop = [NSLayoutConstraint constraintWithItem:LH
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.scrollView
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0];
    
    NSLayoutConstraint *LHLeft = [NSLayoutConstraint constraintWithItem:LH
                                                              attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:LHNight
                                                              attribute:NSLayoutAttributeRight
                                                             multiplier:1
                                                               constant:0];
    
    NSLayoutConstraint *LHRight = [NSLayoutConstraint constraintWithItem:LH
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.scrollView
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1
                                                                constant:0];
    //    NSLayoutConstraint *LHInBottom = [NSLayoutConstraint constraintWithItem:LHIn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:0];
    NSLayoutConstraint *LHWidth = [NSLayoutConstraint constraintWithItem:LH
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.scrollView
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:1
                                                                constant:0];
    
    NSLayoutConstraint *LHHeight = [NSLayoutConstraint constraintWithItem:LH
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:1
                                                                 constant:0];
    
    
    // at least one constraint between the bototm of an image view and the scorll view.
    // a constraint betwene the last image view and the right side of the scroll view.
    
    
    //    [self.scrollView addConstraint:LHInBottom];
    [self.scrollView addConstraint:LHTop];
    [self.scrollView addConstraint:LHRight];
    [self.scrollView addConstraint:LHLeft];
    [self.scrollView addConstraint:LHWidth];
    [self.scrollView addConstraint:LHHeight];
}

#pragma mark - IBActions

- (IBAction)tapped:(UITapGestureRecognizer *)sender {
    
    CGPoint tappedLocation = [self.tapRecognizer locationInView:self.scrollView];
    
    // Give Back the ui view
    UIImageView *tappedImage = (UIImageView *)[self.scrollView hitTest:tappedLocation withEvent:nil];
    
    
    [self performSegueWithIdentifier:@"showDetail" sender:tappedImage.image];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        DetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.image = sender;
        
    }
    
}

#pragma mark - Scroll View delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int pageNo = round(self.scrollView.contentOffset.x / self.scrollView.frame.size.width);
    NSLog(@"Page number is %i", pageNo);
    
    self.pageView.currentPage = (NSInteger)pageNo;
    
}

@end
