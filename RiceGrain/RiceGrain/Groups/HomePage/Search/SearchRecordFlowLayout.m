//
//  SearchRecordFlowLayout.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import "SearchRecordFlowLayout.h"

@implementation SearchRecordFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSArray * attributes = [[NSArray alloc] initWithArray:array copyItems:YES];
    
    for (NSInteger i = 1 ; i < attributes.count ; i ++ ) {
        
        UICollectionViewLayoutAttributes *currentAttribute = attributes[i];
        UICollectionViewLayoutAttributes *previousAttribute = attributes[i - 1];
        
        if (![previousAttribute.representedElementKind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
            
            CGFloat previousItemMaxX = CGRectGetMaxX(previousAttribute.frame);
            
            CGFloat currentItemY = currentAttribute.frame.origin.y;
            CGFloat currentItemWidth = currentAttribute.frame.size.width;
            CGFloat currentItemHeight = currentAttribute.frame.size.height;
            
            CGFloat previousItemY = previousAttribute.frame.origin.y;
            CGFloat previousItemWidth = previousAttribute.frame.size.width;
            CGFloat previousItemHeight = previousAttribute.frame.size.height;
            
            if (previousAttribute.indexPath.row == 0) {
                previousAttribute.frame = CGRectMake(0, previousItemY, previousItemWidth, previousItemHeight);
            }
            
            if (currentAttribute.frame.origin.y > previousAttribute.frame.origin.y ) {
                currentAttribute.frame = CGRectMake(0, currentItemY, currentItemWidth, currentItemHeight);
            }else if (currentAttribute.frame.origin.y == previousAttribute.frame.origin.y) {
                currentAttribute.frame = CGRectMake(previousItemMaxX + 10, currentItemY, currentItemWidth, currentItemHeight);
            }
        }
    }
    
    return attributes;
}

@end
