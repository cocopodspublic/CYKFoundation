//
//  CommentHeader.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#ifndef CommentHeader_h
#define CommentHeader_h

#define WeakSelf __weak typeof(self) weakSelf = self;
#define Strong_Self __strong typeof(weakSelf)self = weakSelf;

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

// 判断iPhone5
#define     isIPhone5           ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPad
#define     isPad               (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)
/**
 *  Constant width & height
 */
#define     kBOTTOM_BAR_HEIGHT      (IS_IPhoneX_All ? 84.0f : 50.0f)
#define     kBOTTOM_BUTTON_WIDTH    200.0f
#define     kEDIT_BAR_HEIGHT        44.0f
#define     kSafeAreaStatusHeight   (IS_IPhoneX_All ? 44 : 20)
#define     kSafeAreaTopHeight      (IS_IPhoneX_All ? 88 : 64)
#define     kSafeAreaBottomHeight   (IS_IPhoneX_All ? 34 : 0)
#define     kSafeAreaTopNONavHeight (IS_IPhoneX_All ? 30 : 0)
#define HeaderScrollViewHeight  (kSafeAreaTopHeight)    //滑动多少让上边的导航栏完全不透明

//屏幕适配
#define H(h) (h)*SCREEN_H/667
#define W(w) (w)*SCREEN_W/375


// 苹方字体
#define PINGFANG_Regular_FONT(X)        [UIFont fontWithName:@"PingFangSC-Regular" size:X]
#define PINGFANG_LIGHT_FONT(X)   [UIFont fontWithName:@"PingFangSC-Light" size:X]
#define PINGFANG_Medium_FONT(X)    [UIFont fontWithName:@"PingFangSC-Medium" size:X] //粗体
#define PINGFANG_Semibold_FONT(X)        [UIFont fontWithName:@"PingFangSC-Semibold" size:X]
//
#define DIN_ALTER_BOLD_FONT(X)   [UIFont fontWithName:@"DINAlternate-Bold" size:X]
#define DIN_REGULAR_FONT(X)     [UIFont fontWithName:@"DIN-Regular" size:X]
#define     FONTNAMEWITHSIZE(fontName,fontSize) [UIFont fontWithName:fontName size:fontSize]



#define HEX_COLOR(hexStr) [UIColor colorWithHexString:hexStr]
#define     RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define     RGBCOLOR(r,g,b)     RGBACOLOR(r,g,b,1.0)
#define     CLEAR_COLOR         [UIColor clearColor]
#define     RED_COLOR           [UIColor redColor]
#define     WHITE_COLOR         [UIColor whiteColor]
#define     BLACK_COLOR         [UIColor blackColor]
#define     GREEN_COLOR         [UIColor greenColor]
#define     BLUE_COLOR          [UIColor blueColor]
#define     GRAY_COLOR          [UIColor grayColor]
#define     LIGHTGRAY_COLOR     [UIColor lightGrayColor]
#define     DARKGRAY_COLOR      [UIColor darkGrayColor]
#define     ORANGE_COLOR        [UIColor orangeColor]
#define     DARKTEXT_COLOR      [UIColor darkTextColor]




#define     IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]


#ifdef DEBUG

#define DLog(...) NSLog(@"----当前线程:%@----%s 第%d行 \n %@\n\n",[NSThread currentThread],__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])


#else
#define  DGLog(...)

#endif

#endif /* CommentHeader_h */
