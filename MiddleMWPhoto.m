//
//  MiddleMWPhoto.m
//  PhotoBrowserDemo
//
//  Created by Eden on 9/22/14.
//
//

#import "MiddleMWPhoto.h"
#import <SDWebImage/SDImageCache.h>

@implementation MiddleMWPhoto

@synthesize photos;
@synthesize thumbs;
@synthesize displayActionButton;
@synthesize displayNavArrows;
@synthesize displaySelectionButtons;
@synthesize enableGrid;
@synthesize startOnGrid;
@synthesize browser;

- (id)init{
    
    self = [super init];
    if (self) {
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] clearMemory];
        [self basicSetting];
        [self setupBrowser];
    }
    
    return self;
}

- (void)basicSetting{
    
    displaySelectionButtons = NO;
    displayActionButton = NO;
    displayNavArrows = NO;
    enableGrid = NO;
    startOnGrid = NO;
}

- (void)setupBrowser{
    
    browser.displayActionButton = displayActionButton;
    browser.displayNavArrows = displayNavArrows;
    browser.displaySelectionButtons = displaySelectionButtons;
    browser.alwaysShowControls = displaySelectionButtons;
    browser.zoomPhotosToFill = YES;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;
#endif
    browser.enableGrid = enableGrid;
    browser.startOnGrid = startOnGrid;
    browser.enableSwipeToDismiss = YES;
    
    
}

- (void)setShowPhotoIndex:(unsigned int)CurrentIndex{
    
    if (CurrentIndex > [photos count]) {
        [browser setCurrentPhotoIndex:[photos count]];
    }else{
        [browser setCurrentPhotoIndex:CurrentIndex];
    }
}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    if (index < photos.count) {
        return [photos objectAtIndex:index];
    }else{
        return nil;
    }
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index{
    if (index < thumbs.count) {
        return [thumbs objectAtIndex:index];
    }else{
        return nil;
    }
}


@end
