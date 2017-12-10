//
//  ViewController.m
//  ButtonDemo
//
//  Created by dch on 2017/11/15.
//  Copyright © 2017年 dch. All rights reserved.
//

#import "ViewController.h"
//#import "CustomPricesortButton.h"
#import "DCHChangeStateButton.h"
#import "UIView+LCP.h"

//十六进制颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//自定义适配高度比例
#define mh (([UIScreen mainScreen].bounds.size.height/1136.0) * my)

#define my (double)(([UIScreen mainScreen].bounds.size.height/736 > 0)?(667.0/736.0):1)//自定义适配宽度比例
#define mw ([UIScreen mainScreen].bounds.size.width/640.0)

@interface ViewController ()

//@property(nonatomic,strong) DCHChangeStateButton *conditionBtn;
@property (nonatomic, strong) UIButton *curBtn;
@property (nonatomic, strong) NSMutableArray *btnArr;

@end

@implementation ViewController

- (NSMutableArray *)btnArr
{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"价格",@"销售",@"统计", nil];
    CGFloat width = ScreenWidth/titleArr.count;
    for (int i = 0; i < titleArr.count; i++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*width, 64, width, 40)];
        view.backgroundColor = [UIColor orangeColor];
        DCHChangeStateButton  *conditionBtn = [DCHChangeStateButton sharePriceSortBtntitle:titleArr[i] color:[UIColor whiteColor] font:[UIFont systemFontOfSize:14] target:self action:@selector(changeStateAction:)];
        CGFloat btnW = [self calculateWidth:titleArr[i] fontsize:14 labelH:88*mh]+28;
        conditionBtn.frame = CGRectMake(0, 0, btnW, 88*mh);
        conditionBtn.centerX = view.width*0.5;
        conditionBtn.centerY = view.height*0.5;
        conditionBtn.tag = i+1;
        [view addSubview:conditionBtn];
        [self.view addSubview:view];
        [self.btnArr addObject:conditionBtn];
    }
}


- (void)changeStateAction:(DCHChangeStateButton *)btn {

    btn.selected = !btn.selected;
    for (DCHChangeStateButton *conditionBtn in self.btnArr) {
        if (btn==conditionBtn) {
            btn.upImg = btn.selected?[UIImage imageNamed:@"icon_red_triangle_up"]:[UIImage imageNamed:@"icon_gray_triangle_up"];
            btn.downImg = btn.selected?[UIImage imageNamed:@"icon_gray_triangle_down"]:[UIImage imageNamed:@"icon_red_triangle_down"];
        }else{
            conditionBtn.upImg = [UIImage imageNamed:@"icon_gray_triangle_up"];
            conditionBtn.downImg = [UIImage imageNamed:@"icon_gray_triangle_down"];
        }
    }
    if (btn.tag==1) {
        NSLog(@"%@",btn.selected?@"价格从低到高":@"价格从高到低");
    }else if (btn.tag==2) {
        NSLog(@"%@",btn.selected?@"销售量从低到高":@"销售量从高到低");
    }else if (btn.tag==3) {
        NSLog(@"%@",btn.selected?@"统计数从低到高":@"统计数从高到低");
    }
    
    
}

- (CGFloat)calculateWidth:(NSString *)str fontsize:(NSInteger)fontsize labelH:(CGFloat)height
{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dict context:nil];
    return rect.size.width;
}



@end
