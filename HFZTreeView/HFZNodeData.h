//
//  HFZNodeData.h
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFZNodeData : NSObject

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, assign) NSUInteger nodeCount;
@property (nonatomic, assign) NSUInteger level;
@property (nonatomic, strong) NSMutableArray *childNode;
@property (nonatomic, weak) HFZNodeData *parentNode;
@property (nonatomic, weak) HFZNodeData *brotherNode;

@property (nonatomic, strong) id dataSourc;

- (instancetype)initWithDataSource : (id) data;

- (HFZNodeData *)getRootNode;
- (HFZNodeData *)nextNode;
- (NSArray *) getShowNodeArray;

- (void)insertChildData:(HFZNodeData *)data;
- (void)removeAllChild;

@end
