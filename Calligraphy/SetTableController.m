//
//  SetTableController.m
//  Calligraphy
//
//  Created by Lin on 15/5/24.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "SetTableController.h"
#import <UMSocial.h>
@interface SetTableController ()<UMSocialUIDelegate>

@end

@implementation SetTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        //评论
        NSString *appURL = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
        
    }
    else if (indexPath.section == 1 && indexPath.row == 1) {
        //分享
        
        NSString *appURL = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%@",kAppID];
        
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:kUMengKey
                                          shareText:appURL
                                         shareImage:nil
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToEmail,UMShareToSms,UMShareToSina,UMShareToTencent,nil]
                                           delegate:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end