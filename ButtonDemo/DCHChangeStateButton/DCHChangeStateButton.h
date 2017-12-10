//
//  DCHChangeStateButton.h
//  ButtonDemo
//
//  Created by dch on 2017/11/21.
//  Copyright © 2017年 dch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHChangeStateButton : UIButton

@property(strong, nonatomic)UIImage *upImg;
@property(strong, nonatomic)UIImage *downImg;
@property(strong, nonatomic)UIImageView *upImgView;
@property(strong, nonatomic)UIImageView *downImgView;

+ (instancetype) sharePriceSortBtntitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action;

/*
 title:
 color:
 font:
 defaultUpImg:按钮的上面的默认图片
 defaultDownImg：按钮的下面的默认图片
 **/
+ (instancetype) sharePriceSortBtntitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font defaultUpImg:(UIImage *)defaultUpImg defaultDownImg:(UIImage *)defaultDownImg  target:(id)target action:(SEL)action;

@end
