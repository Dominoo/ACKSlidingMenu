//
//  ACKSlidingMenu.m
//  ACKSlidingMenu
//
//  Created by Dominik Vesely on 10/16/12.
//  Copyright (c) 2012 Dominik Vesely. All rights reserved.
//

#import "ACKSlidingMenu.h"
#import <QuartzCore/QuartzCore.h>


@interface ACKSlidingMenu()

- (void) createHeader;

@end

@implementation ACKSlidingMenu
@synthesize additionalButtons = _buttons;
@synthesize parentView = _parentView;
@synthesize delegate = _delegate;
@synthesize contentView = _contentView;
@synthesize unfolded = _unfolded;



- (id)initWithParent:(UIView *)parent {
    if(self = [super init] ) {
        _parentView = parent;
        _width = parent.frame.size.width;
        _height = 0;
        _unfolded = YES;
        _buttons = [NSMutableArray array];
        [self createHeader];        
        [parent addSubview:self];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerHeight, _parentView.frame.size.width, 50)];
    _contentView.backgroundColor = [UIColor blackColor];
   
    CGFloat partSize = ( _width / _buttons.count );
    CGFloat offset =  (partSize/ 2) - (kACKButtonSize/2);
    
    CGFloat currW = offset;
    CGFloat currH = kACKButtonTop;
    
    for(UIButton* btn in _buttons) {
        [btn setFrame:CGRectMake(currW,currH,btn.frame.size.width,btn.frame.size.height)];
        [_contentView addSubview:btn];
        currW += partSize;
    }
    
    CGRect frame = _contentView.frame;
    frame.size.height = (currH + kACKButtonSize + kACKButtonTop);
    _contentView.frame = frame;
    
    CGRect mainRect = self.frame;
    mainRect.size.height = _headerHeight + frame.size.height;
    self.frame = mainRect;
    
    [self addSubview:_contentView];
    
}

- (void)createHeader {
    
    _headerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kACKSMHeaderImage]];
    [_headerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerTouched:)]];
    _headerView.userInteractionEnabled = YES;
    
    CGRect hFrame = _headerView.frame;
    hFrame.origin = CGPointMake((_width/2) - (hFrame.size.width/2), 0);
    _headerView.frame = hFrame;
    
    _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kACKSMArrowImage]];
    _arrowView.frame = CGRectMake((hFrame.size.width/2) - (_arrowView.frame.size.width/2), kACKSMArrowOffsetTop, _arrowView.frame.size.width, _arrowView.frame.size.height);
    [_headerView addSubview:_arrowView];

    
    _headerHeight = _headerView.frame.size.height;
    _height += _headerHeight;
    CGRect frame = CGRectMake(0, _parentView.frame.size.height-_headerHeight, _width, _headerHeight);
    [self addSubview:_headerView];
    self.frame = frame;

}

- (void)addButton:(UIView *)btn withTarget:(id)target andAction:(SEL)selector {

    [btn setUserInteractionEnabled:YES];
    [btn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:selector]];    
    [_buttons addObject:btn];
    [self layoutSubviews];
}


- (void)headerTouched:(id)sender {
    [UIView animateWithDuration:0.7 animations:^(void)  {
        CGRect frame = self.frame;        
        if(_unfolded) {
            frame = CGRectMake(0, _parentView.frame.size.height-frame.size.height, _width, frame.size.height);            
            _arrowView.layer.transform = CATransform3DMakeRotation(M_PI,1.0,0.0,0.0);
        } else {
            frame = CGRectMake(0, _parentView.frame.size.height-_headerHeight, _width, frame.size.height);
            _arrowView.layer.transform = CATransform3DMakeRotation(M_PI,0.0,0.0,0.0);
        }
        
        _unfolded = !_unfolded;
        self.frame = frame;

    }];
}


@end
