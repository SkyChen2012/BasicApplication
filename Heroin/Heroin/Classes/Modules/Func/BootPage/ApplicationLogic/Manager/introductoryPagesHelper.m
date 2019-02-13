//
//  IntroductoryPagesHelper.m
//  Heroin
//
//  Created by Benson on 2018/9/10.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "IntroductoryPagesHelper.h"
#import "IntroductoryPagesView.h"

@interface IntroductoryPagesHelper()
@property (nonatomic) UIWindow *rootWindow;
@property(nonatomic,strong) IntroductoryPagesView *curIntroductoryPagesView;
@end


@implementation IntroductoryPagesHelper

+ (instancetype)shareInstance
{
    static IntroductoryPagesHelper *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[IntroductoryPagesHelper alloc] init];
    });
    
    return shareInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+(void)showIntroductoryPageView:(NSArray *)imageArray
{
    if (![IntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [IntroductoryPagesHelper shareInstance].curIntroductoryPagesView=[[IntroductoryPagesView alloc]initPagesViewWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) Images:imageArray];
    }
    
    [IntroductoryPagesHelper shareInstance].rootWindow = [UIApplication sharedApplication].keyWindow;
    [[IntroductoryPagesHelper shareInstance].rootWindow addSubview:[IntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
}

@end
