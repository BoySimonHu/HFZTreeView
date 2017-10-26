//
//  ViewController.m
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    HFZTreeView *treeView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    treeView = [[HFZTreeView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    treeView.treeDelegate = self;
    [self.view addSubview:treeView];
    
    HFZNodeData *rootNode = [[HFZNodeData alloc] initWithDataSource:@{@"1":@"2"}];
    
    FirstModel *firstModel0 = [[FirstModel alloc] init];
    firstModel0.title = @"0-0-0";
    FirstModel *firstModel1 = [[FirstModel alloc] init];
    firstModel1.title = @"1-0-0";
    HFZNodeData *firstNode0 = [[HFZNodeData alloc] initWithDataSource:firstModel0];
    HFZNodeData *firstNode1 = [[HFZNodeData alloc] initWithDataSource:firstModel1];
    [rootNode insertChildData:firstNode0];
    [rootNode insertChildData:firstNode1];
    
    SecondModel *secondModel01 = [[SecondModel alloc] init];
    secondModel01.title = @"0-1-0";
    HFZNodeData *secondNode01 = [[HFZNodeData alloc] initWithDataSource:secondModel01];
    SecondModel *secondModel02 = [[SecondModel alloc] init];
    secondModel02.title = @"0-2-0";
    HFZNodeData *secondNode02 = [[HFZNodeData alloc] initWithDataSource:secondModel02];
    [firstNode0 insertChildData:secondNode01];
    [firstNode0 insertChildData:secondNode02];
    
    
    SecondModel *secondModel11 = [[SecondModel alloc] init];
    secondModel11.title = @"1-1-0";
    HFZNodeData *secondNode11 = [[HFZNodeData alloc] initWithDataSource:secondModel11];
    SecondModel *secondModel12 = [[SecondModel alloc] init];
    secondModel12.title = @"1-2-0";
    HFZNodeData *secondNode12 = [[HFZNodeData alloc] initWithDataSource:secondModel12];
    [firstNode1 insertChildData:secondNode11];
    [firstNode1 insertChildData:secondNode12];
    
    ThirdModel *thirdModel111 = [[ThirdModel alloc] init];
    thirdModel111.title = @"1-1-1";
    HFZNodeData *thirdNode111 = [[HFZNodeData alloc] initWithDataSource:thirdModel111];
    [secondNode11 insertChildData:thirdNode111];
    
    treeView.nodeData = rootNode;
    
}

- (CGFloat)cellHeightOfNode:(HFZNodeData *)data withTreeView:(HFZTreeView *)treeView
{
    if ([data.dataSourc isEqual:[FirstModel class]])
    {
        return 40.0f;
    }
    else if ([data.dataSourc isEqual:[SecondModel class]])
    {
        return 30.0f;
    }
    else
    {
        return 80.0f;
    }
}

- (HFZTreeViewCell *)treeView:(HFZTreeView *)view cellForRowAtNodeData:(HFZNodeData *)data
{
    if ([data.dataSourc isKindOfClass:[FirstModel class]])
    {
        FirstTreeViewCell *cell = [view dequeueReusableCellWithIdentifier:@"FirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTreeViewCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    else if ([data.dataSourc isKindOfClass:[SecondModel class]])
    {
        SecondTreeViewCell *cell = [view dequeueReusableCellWithIdentifier:@"SecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SecondTreeViewCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    else
    {
        ThirdTreeViewCell *cell = [view dequeueReusableCellWithIdentifier:@"ThirdCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ThirdTreeViewCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
