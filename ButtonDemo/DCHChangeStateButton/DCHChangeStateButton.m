//
//  CustomPricesortButton.m
//  Pica
//
//  Created by dch on 2017/9/13.
//  Copyright © 2017年 dch. All rights reserved.
//

#import "DCHChangeStateButton.h"
#import "UIView+LCP.h"

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//自定义适配高度比例
#define mh (([UIScreen mainScreen].bounds.size.height/1136.0) * my)

#define my (double)(([UIScreen mainScreen].bounds.size.height/736 > 0)?(667.0/736.0):1)//自定义适配宽度比例
#define mw ([UIScreen mainScreen].bounds.size.width/640.0)

@interface DCHChangeStateButton ()

@end

@implementation DCHChangeStateButton
//@synthesize upImg = _upImg;
//@synthesize downImg = _downImg;


//


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, self.width-28, 18);
    self.titleLabel.centerX = self.width*0.5-5;
    self.titleLabel.centerY = self.height*0.5;
    //    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.upImgView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+3, self.height*0.5-7, 10, 5);
    self.downImgView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+3, self.height*0.5+2, 10, 5);
}

+ (instancetype) sharePriceSortBtnFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

+ (instancetype) sharePriceSortBtntitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    return [self buttonWithType:UIButtonTypeCustom title:title color:color font:font target:target action:action];
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title color:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    DCHChangeStateButton *btn = [DCHChangeStateButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //    btn.upImgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, btn.height*0.5-9, 10, 5)];
    btn.upImgView = [[UIImageView alloc] init];
    btn.upImgView.image = [UIImage imageNamed:@"icon_gray_triangle_up"];
    //    btn.downImgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, btn.height*0.5+4, 10, 5)];
    btn.downImgView = [[UIImageView alloc] init];
    btn.downImgView.image = [UIImage imageNamed:@"icon_gray_triangle_down"];
    [btn addSubview:btn.upImgView];
    [btn addSubview:btn.downImgView];
    
    return btn;
}

+ (instancetype) sharePriceSortBtntitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font defaultUpImg:(UIImage *)defaultUpImg defaultDownImg:(UIImage *)defaultDownImg  target:(id)target action:(SEL)action
{
    return [self buttonWithType:UIButtonTypeCustom title:title color:color font:font defaultUpImg:defaultUpImg defaultDownImg:defaultDownImg target:target action:action];
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title color:(UIColor *)color font:(UIFont *)font defaultUpImg:(UIImage *)defaultUpImg defaultDownImg:(UIImage *)defaultDownImg target:(id)target action:(SEL)action
{
    DCHChangeStateButton *btn = [DCHChangeStateButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    
    [btn setTitleColor:color forState:UIControlStateNormal];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //    btn.upImgView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 180*mw)/4+20, 88*mh/2-7, 10, 5)];
    btn.upImgView.image = defaultUpImg;
    //    btn.downImgView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 180*mw)/4+20, 88*mh/2+2, 10, 5)];
    btn.downImgView.image = defaultDownImg;
    [btn addSubview:btn.upImgView];
    [btn addSubview:btn.downImgView];
    
    return btn;
}

- (void)setUpImg:(UIImage *)upImg
{
    _upImg = upImg;
    self.upImgView.image = upImg;
}

- (void)setDownImg:(UIImage *)downImg
{
    _downImg = downImg;
    self.downImgView.image = downImg;
}




@end

