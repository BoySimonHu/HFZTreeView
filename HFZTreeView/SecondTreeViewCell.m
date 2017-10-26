//
//  SecondTreeViewCell.m
//  HFZTreeView
//
//  Created by Simon on 16/4/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "SecondTreeViewCell.h"
#import "SecondModel.h"

@implementation SecondTreeViewCell

- (void)setNodeData:(HFZNodeData *)nodeData
{
    [super setNodeData:nodeData];
    [self.titleLabel setText:((SecondModel *)nodeData.dataSourc).title];
}

@end
