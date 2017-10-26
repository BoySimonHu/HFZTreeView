//
//  HFZNodeData.m
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HFZNodeData.h"

@implementation HFZNodeData

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.isOpen = NO;
        self.isSelect = NO;
        self.level = 0;
        self.childNode = [NSMutableArray array];
        self.parentNode = nil;
        self.brotherNode = nil;
    }
    return self;
}

- (instancetype)initWithDataSource:(id)data
{
    if (self = [super init])
    {
        _dataSourc = data;
        self.isOpen = NO;
        self.isSelect = NO;
        self.level = 0;
        self.childNode = [NSMutableArray array];
        self.parentNode = nil;
        self.brotherNode = nil;
    }
    return self;
}

//get nodeCount
- (NSUInteger)nodeCount
{
    NSUInteger count = 1;
    if (self.isOpen)
    {
        for (HFZNodeData *data in self.childNode)
        {
            count += data.nodeCount;
        }
    }
    return count;
    
}

//set isOpen
- (void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    for (HFZNodeData *data in self.childNode)
    {
        data.isSelect = _isSelect;
    }
}

- (HFZNodeData *)nextNode
{
    if (self.isOpen && self.childNode.count != 0)
    {
        return self.childNode[0];
    }
    else
    {
        for (HFZNodeData *data = self; data != nil; data = data.parentNode)
        {
            if (data.brotherNode != nil)
            {
                return data.brotherNode;
            }
        }
        return nil;
    }
}

//get root node
- (HFZNodeData *)getRootNode
{
    HFZNodeData *data = self;
    if (data.parentNode != nil)
    {
        data = data.parentNode;
    }
    return data;
}

- (NSArray *)getShowNodeArray
{
    NSMutableArray *nodeArr = [NSMutableArray array];
    if (self.childNode.count == 0) {
        return [NSArray arrayWithArray:nodeArr];
    }
    
    for (HFZNodeData *data = self.childNode[0]; data != nil && data.level > self.level; data = [data nextNode])
    {
        [nodeArr addObject:data];
    }
    
    return [NSArray arrayWithArray:nodeArr];
}

- (void)insertChildData:(HFZNodeData *)data
{
    data.level = self.level + 1;
    data.parentNode = self;
    data.brotherNode = nil;
    if (self.childNode.count > 0)
    {
        ((HFZNodeData *)self.childNode[self.childNode.count - 1]).brotherNode = data;
    }
    [self.childNode addObject:data];
    
}

- (void)removeAllChild
{
    [self.childNode removeAllObjects];
}

@end
