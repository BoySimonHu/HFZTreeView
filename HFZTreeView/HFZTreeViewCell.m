//
//  HFZTreeViewCell.m
//  HFZTreeView
//
//  Created by Simon on 16/4/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HFZTreeViewCell.h"

@implementation HFZTreeViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    
    return self;
}

- (void)setNodeData:(HFZNodeData *)nodeData
{
    _nodeData = nodeData;
    [self initFoldButton];
}

- (void)initFoldButton
{
    if (!self.foldButton)
    {
        self.foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.foldButton.frame = self.bounds;
        [self.foldButton addTarget:self action:@selector(actionFoldButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.foldButton];
    }
    self.foldButton.selected = self.nodeData.isOpen;

}

- (void)actionFoldButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.nodeData.isOpen = sender.selected;
    if ([self.cellDelegate respondsToSelector:@selector(didSelectCellAction:)])
    {
        [self.cellDelegate didSelectCellAction:self];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
