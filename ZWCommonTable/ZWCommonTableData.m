//
//  ZWCommonTableData.m
//  YLTOA
//
//  Created by 王子武 on 2017/1/13.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonTableData.h"

#define DefaultRowHeight                50
#define DefaultTitleFontSize            15
#define DefaultDetailTitleFont          15
@implementation ZWCommonTableRow

- (instancetype)initWithDic:(NSDictionary *)rowDict{
    //hidden cell
    if ([rowDict[IsHiddenCell] boolValue]) return nil;
    self = [super init];
    if (self) {
        _cellTitle              = rowDict[CellTitle];
        _cellTitleFont          = [rowDict[CellTitleFont] floatValue];
        _cellTitleFont          = _cellTitleFont?_cellTitleFont:DefaultTitleFontSize;
        _cellImageName          = rowDict[CellImageName];
        _cellDetailTitle        = rowDict[CellDetailTitle];
        _cellDetailTitleFont    = [rowDict[CellDetailTitleFont] floatValue];
        _cellDetailTitleFont    = _cellDetailTitleFont?_cellDetailTitleFont:DefaultDetailTitleFont;
        _cellClassName          = rowDict[CellClassName];
        _cellPushVcClassName    = rowDict[CellPushVcClassName];
        _cellActionSelName      = rowDict[CellActionSelName];
        _cellRowHeight          = [rowDict[CellRowHeight] floatValue];
        _cellRowHeight          = _cellRowHeight?_cellRowHeight:DefaultRowHeight;
        _isHiddenAccessory        = [rowDict[IsHiddenAccessory] boolValue];
        _isForbidSelect         = [rowDict[IsForbidSelect] boolValue];
        _cellExtraInfo          = rowDict[CellExtraInfo];
        _cellPushVcKeyValue     = rowDict[CellPushVcKeyValue];
        _isCellSwitchOn         = [rowDict[IsCellSwitchOn] boolValue];
    }
    return self;
}
+ (NSArray *)rowsWithData:(NSArray *)rowsArr{
    NSMutableArray *array = @[].mutableCopy;
    for (NSDictionary *dict in rowsArr) {
        ZWCommonTableRow *rowModel = [[ZWCommonTableRow alloc] initWithDic:dict];
        if (rowModel)[array addObject:rowModel];
    }
    return array;
}

@end

@implementation ZWCommonTableSection

- (instancetype)initWithDic:(NSDictionary *)secDict{
    self = [super init];
    if (self) {
        _headerTitle    = secDict[SectionHeaderTitle];
        _footerTitle    = secDict[SectionFooterTitle];
        _headerHeight   = [secDict[SectionHeaderHeight] floatValue];
        _footerHeight   = [secDict[SectionFooterHeight] floatValue];
        _tableRows      = [ZWCommonTableRow rowsWithData:secDict[SectionRows]];
    }
    return self;
}
+ (NSArray *)sectionsWithData:(NSArray *)sectionsArr{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in sectionsArr) {
        ZWCommonTableSection *sectionModel = [[ZWCommonTableSection alloc] initWithDic:dict];
        if (sectionModel)[array addObject:sectionModel];
    }
    return array;
}
@end

