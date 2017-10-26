//
//  HFZTreeView.m
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HFZTreeView.h"

@implementation HFZTreeView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark --datasource, delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nodeData getShowNodeArray].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.treeDelegate respondsToSelector:@selector(cellHeightOfNode:withTreeView:)])
    {
        HFZNodeData *data = [self.nodeData getShowNodeArray][indexPath.row];
        CGFloat cellHeight = [self.treeDelegate cellHeightOfNode:data withTreeView:self];
        return cellHeight;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HFZNodeData *data = [self.nodeData getShowNodeArray][indexPath.row];
    HFZTreeViewCell *cell = [self.treeDelegate treeView:self cellForRowAtNodeData:data];
    cell.cellDelegate = self;
    cell.nodeData = data;
    return cell;
}

- (void)didSelectCellAction:(HFZTreeViewCell *)cell
{
    NSInteger currentCellIndex = [[self.nodeData getShowNodeArray] indexOfObject:cell.nodeData] + 1;
    NSInteger indexCount = [cell.nodeData getShowNodeArray].count;
    NSMutableArray *indexArr = [NSMutableArray array];
    for (int i = 0; i < indexCount; i ++)
    {
        [indexArr addObject:[NSIndexPath indexPathForRow:currentCellIndex + i inSection:0]];
    }
    
    if (cell.nodeData.isOpen == NO)
    {
        [self deleteRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationTop];
    }
    else
    {
        [self insertRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationBottom];
    }
}

/**暂时没有用，本来是想获得cell的高度，用来调整button的大小的，后来采用了cell的bound*/
- (CGFloat)cellHeightWithNode:(HFZNodeData *)node
{
    if ([self.treeDelegate respondsToSelector:@selector(cellHeightOfNode:withTreeView:)])
    {
        CGFloat cellHeight = [self.treeDelegate cellHeightOfNode:node withTreeView:self];
        return cellHeight;
    }
    
    return 0;
}

- (void)setNodeData:(HFZNodeData *)nodeData
{
    _nodeData = nodeData;
    [self reloadData];
}

@end
