//
//  UICollectionViewFlowLayout.h
package objc.ios.ui;
//
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import <UIKit/UICollectionViewLayout.h>
#import <UIKit/UICollectionView.h>
#import <UIKit/UIKitDefines.h>
#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString *const UICollectionElementKindSectionHeader;
UIKIT_EXTERN NSString *const UICollectionElementKindSectionFooter;

typedef NS_ENUM(NSInteger, UICollectionViewScrollDirection) {
    UICollectionViewScrollDirectionVertical,
    UICollectionViewScrollDirectionHorizontal
};

extern interface UICollectionViewDelegateFlowLayout <UICollectionViewDelegate>
@optional

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

}

NS_CLASS_AVAILABLE_IOS(6_0)extern class UICollectionViewFlowLayout : UICollectionViewLayout

	public var CGFloat minimumLineSpacing;
	public var CGFloat minimumInteritemSpacing;
	public var CGSize itemSize;
	public var UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
	public var CGSize headerReferenceSize;
	public var CGSize footerReferenceSize;

	public var UIEdgeInsets sectionInset;

}
