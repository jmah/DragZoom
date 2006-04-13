// class-dumped from Preview 3.0.4

#import <Cocoa/Cocoa.h>

@class PVDocument;
@class PVImageView;


@interface PVImageBackground : NSView
{
    PVDocument *mDocument;
    PVImageView *mPVImageView;
    struct _NSSize mImageSize;
    struct _NSSize mScalingFactor;
    int mZoomSteps;
    int mExifOrientation;
    int mUnits;
    BOOL mAutoZoom;
    BOOL mWhileSettingDocument;
}

- (id)initWithFrame:(struct _NSRect)fp8;
- (void)awakeFromNib;
- (BOOL)isOpaque;
- (void)dealloc;
- (void)pvWindowWillClose;
- (void)windowBackgroundColorChanged:(id)fp8;
- (BOOL)isFlipped;
- (void)___drawRect:(struct _NSRect)fp8;
- (struct _NSRect)rectForWindowStandardFrame:(struct _NSRect)fp8;
- (struct _NSSize)calcActualSizeScalingFactor;
- (struct _NSSize)calcSizeToFitScalingFactorForFrame:(struct _NSRect)fp8;
- (void)zoomImageViewToFit;
- (void)centerImageFrame;
- (void)adjustFrameAndImage;
- (struct _NSSize)imageSize;
- (struct _NSSize)imageSizeRespectingEXIFOrientation;
- (struct _NSSize)windowWillResize:(id)fp8 toSize:(struct _NSSize)fp12;
- (void)windowDidResize;
- (id)imageView;
- (void)copy:(id)fp8;
- (id)userSelection;
- (BOOL)performKeyEquivalent:(id)fp8;
- (void)setDocument:(id)fp8 forceReload:(BOOL)fp12;
- (void)disableScreenUpdates;
- (void)enableScreenUpdates;
- (void)resizeImageViewToFit;
- (struct _NSPoint)currentCenter;
- (void)centerOnPoint:(struct _NSPoint)fp8;
- (double)zoom:(struct _NSPoint)fp8;
- (void)zoomAtPoint:(struct _NSPoint)fp8 isMouseDownEvent:(BOOL)fp16 zoomIn:(BOOL)fp20;
- (void)zoomIn;
- (void)zoomOut;
- (void)zoomToSelection;
- (void)zoomToScale:(id)fp8;
- (void)zoomToFit;
- (void)actualSize;
- (void)setAutoZoom:(BOOL)fp8;
- (void)toggleAutoZoom;
- (BOOL)isActualSize;
- (BOOL)autoZoomEnabled;
- (struct _NSSize)scalingFactor;
- (BOOL)isZoomedToFit;
- (BOOL)sizeToFitEnabled;
- (void)adjustImageViewFrameRotation;
- (void)rotate:(int)fp8;
- (void)flip:(int)fp8;
- (unsigned int)draggingEntered:(id)fp8;
- (void)draggingExited:(id)fp8;
- (BOOL)performDragOperation:(id)fp8;

@end
