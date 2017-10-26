//
//  ThirdTreeViewCell.m
//  HFZTreeView
//
//  Created by Simon on 16/4/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "ThirdTreeViewCell.h"
#import "ThirdModel.h"

@implementation ThirdTreeViewCell

- (void)setNodeData:(HFZNodeData *)nodeData
{
    [super setNodeData:nodeData];
    [self.titleLabel setText:((ThirdModel *)nodeData.dataSourc).title];
}

@end
