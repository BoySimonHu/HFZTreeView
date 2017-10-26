//
//  HFZTreeViewCell.h
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFZNodeData.h"

@class HFZTreeViewCell;

@protocol HFZTreeViewCellDelegate <NSObject>

- (CGFloat)cellHeightWithNode:(HFZNodeData *)node;
- (void)didSelectCellAction:(HFZTreeViewCell *)cell;

@end

@interface HFZTreeViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *foldButton;

@property (nonatomic, strong) HFZNodeData *nodeData;
@property (nonatomic, weak) id <HFZTreeViewCellDelegate> cellDelegate;

@end
