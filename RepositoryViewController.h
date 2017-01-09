//
//  RepositoryViewController.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/26.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class CompanyViewController;
#import "CompanyViewController.h"

@protocol ChangeRepositoryDelegate <NSObject>

- (void) changeRepositoryWithRepoName:(NSString *)repoName;

@end

@interface RepositoryViewController : UIViewController<RefreshDelegate>

@property (nonatomic,weak) id<ChangeRepositoryDelegate> delegate;

@end
