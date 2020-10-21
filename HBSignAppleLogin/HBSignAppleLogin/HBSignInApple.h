//
//  HBSignInApple.h
//  HBSignAppleLogin
//
//  Created by Mac on 2020/10/21.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBSignInApple : NSObject
// 处理授权
- (void)handleAuthorizationAppleIDButtonPress;

// 如果存在iCloud Keychain 凭证或者AppleID 凭证提示用户
- (void)perfomExistingAccountSetupFlows;
@end

NS_ASSUME_NONNULL_END
