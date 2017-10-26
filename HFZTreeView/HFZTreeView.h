//
//  HFZTreeView.h
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFZTreeViewCell.h"
#import "HFZNodeData.h"

@class HFZTreeView;

@protocol  HFZTreeViewDelegate <NSObject>

@required
- (HFZTreeViewCell *) treeView:(HFZTreeView *)view cellForRowAtNodeData:(HFZNodeData *)data;
- (CGFloat) cellHeightOfNode :(HFZNodeData *)data withTreeView:(HFZTreeView *)treeView;

@end

@interface HFZTreeView : UITableView <UITableViewDelegate, UITableViewDataSource, HFZTreeViewCellDelegate>

@property (nonatomic, strong) HFZNodeData *nodeData;
@property (nonatomic, weak) id<HFZTreeViewDelegate> treeDelegate;

@end
