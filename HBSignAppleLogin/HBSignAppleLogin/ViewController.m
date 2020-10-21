//
//  ViewController.m
//  HBSignAppleLogin
//
//  Created by Mac on 2020/10/21.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <AuthenticationServices/AuthenticationServices.h>
#import "HBSignInApple.h"//苹果登录
//苹果登录通知
#define     APPLELOGINNOTICE           @"APPLELOGINNOTICE"
@interface ViewController ()
// 防止被释放，回调方法不会走，或者也可以把SignInApple这个类写成单例
@property (nonatomic, strong) HBSignInApple *signInApple;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图
    [self addSubViewUI];
    //苹果登录通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appleLoginSuccess:) name:APPLELOGINNOTICE object:nil];
}
#pragma mark 苹果登录通知
-(void)appleLoginSuccess:(NSNotification*)notice
{
    __block NSDictionary*userInfo=notice.userInfo;
    if (userInfo[@"appleToken"])
    {
//        __weak weakSelf = self;
//        [userManager appleOneLoginSende:userInfo[@"appleToken"] completionBlock:^(BOOL success, id dic) {
//            if (success) {
//                //成功 微信登录成功
//
//            }else{
//                //失败
//
//            }
//        }];
    }
    else
    {
//        [self showInfoHudWithMessage:userInfo[@"msg"]];
    }
}
#pragma mark ==========添加子视图==========
-(void)addSubViewUI{
    ASAuthorizationAppleIDButton *authorization = [[ASAuthorizationAppleIDButton alloc]init];
    [authorization addTarget:self action:@selector(clickAuthorization) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:authorization];
    [authorization mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
}
#pragma mark ==========点击授权==========
-(void)clickAuthorization{
    // 封装Sign In with Apple 登录工具类，使用这个类时要把类对象设置为全局变量，或者直接把这个工具类做成单例，如果使用局部变量，和IAP支付工具类一样，会导致苹果回调不会执行
    self.signInApple = [[HBSignInApple alloc] init];
    [self.signInApple handleAuthorizationAppleIDButtonPress];
}
@end
