//
//  MiddleMWPhoto.h
//  PhotoBrowserDemo
//
//  Created by Eden on 9/22/14.
//
//

#import <Foundation/Foundation.h>
#import "MWPhotoBrowser.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MiddleMWPhoto : NSObject <MWPhotoBrowserDelegate>{
}
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic) BOOL displayActionButton;
@property (nonatomic) BOOL displaySelectionButtons;
@property (nonatomic) BOOL displayNavArrows;
@property (nonatomic) BOOL enableGrid;
@property (nonatomic) BOOL startOnGrid;
@property (nonatomic, strong) MWPhotoBrowser *browser;

/**
 * @brief Setting Browser First Photo
 *
 * @param CurrentIndex : 顯示照片
 *
 * @return
 *
 * @exception
 *
 * @see
 *
 * @warning CurrentIndex Can't Bigger then Array Count.
 *
 * @bug 
 */
- (void)setShowPhotoIndex:(unsigned int)CurrentIndex;
@end
