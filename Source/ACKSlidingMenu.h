//
//  ACKSlidingMenu.h
//  ACKSlidingMenu
//
//  Created by Dominik Vesely on 10/16/12.
//  Copyright (c) 2012 Dominik Vesely. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kACKSMHeaderImage @"ACKSMHeader.png"
#define kACKSMArrowImage @"ACKSMArrow.png"
#define kACKSMArrowOffsetTop 10
#define kACKButtonSize 76
#define kACKButtonTop 20


@protocol ACKSlidingMenuDelegate;


@interface ACKSlidingMenu : UIView {
    
    UIButton *_mainButton;
    UIImageView *_mainBackgroundImageView;
    CGFloat _width;
    CGFloat _height;
    CGFloat _headerHeight;
    UIImageView* _arrowView;
    UIImageView* _headerView;
   
}

@property (nonatomic, weak) id<ACKSlidingMenuDelegate> delegate;
@property (nonatomic, weak) UIView *parentView;                               
@property (nonatomic, readonly) BOOL unfolded;                                
@property (nonatomic, strong, readonly) UIView *contentView;                   
@property (nonatomic, strong, readonly) NSMutableArray *additionalButtons;


- (id) initWithParent:(UIView*) parent;
- (void) headerTouched:(id) sender;
- (void) addButton:(UIView*)btn withTarget:(id) target andAction:(SEL) selector;



@end
