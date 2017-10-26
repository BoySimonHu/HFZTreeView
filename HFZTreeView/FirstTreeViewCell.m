//
//  FirstTreeViewCell.m
//  HFZTreeView
//
//  Created by Simon on 16/4/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "FirstTreeViewCell.h"
#import "FirstModel.h"

@implementation FirstTreeViewCell

- (void)setNodeData:(HFZNodeData *)nodeData
{
    [super setNodeData:nodeData];
    [self.titleLable setText:((FirstModel *)nodeData.dataSourc).title];
}

@end
