//
//  CompanyViewController.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/26.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RefreshDelegate <NSObject>

- (void) refreshDataWithCompanyName:(NSString *)cName;

@end

@protocol ChangeCompanyTitle <NSObject>

- (void) changeCompanyTitleWithNewTitle:(NSString *)newTitle;

@end

@interface CompanyViewController : UIViewController

@property (nonatomic,weak) id<RefreshDelegate> delegate;

@property (nonatomic,weak) id<ChangeCompanyTitle> changeTitleDelegate;
@end
