// class-dumped from Preview 3.0.4

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class PDFPage;
@class PDFAnnotation;
@class PVPDFTextAnnotationWindow;
@class PDFPageCache;


@interface PVPDFView : PDFView
{
    int _mouseClicks;
    PDFPage *_activePage;
    PDFAnnotation *_activeAnnotation;
    struct _NSRect _marquee;
    struct _NSRect _wasBounds;
    struct _NSPoint _mouseDownLoc;
    struct _NSPoint _clickDelta;
    struct _NSPoint _wasOrigin;
    int _toolMode;
    int _selectMode;
    BOOL _dragging;
    NSTextField *_annotationControl;
    int _annotationType;
    BOOL _resizeAnnotation;
    PVPDFTextAnnotationWindow *_frontAnnotationWindow;
    NSMutableArray *_textAnnotationWindows;
    BOOL _softProof;
    NSImage *_selectionKnob;
    NSColor *_lastOvalColor;
    NSColor *_lastTextColor;
    BOOL _cachingEnable;
    PDFPageCache *_pageCache;
    NSTimer *_cacheRedrawTimer;
    NSTimer *_resumeCacheTimer;
    BOOL _forceSourceRedraw;
}

- (void)dealloc;
- (void)scrollSelectionToVisible:(id)fp8;
- (void)drawPage:(id)fp8;
- (BOOL)pageIsSmallEnoughToCache:(id)fp8;
- (void)drawPagePost:(id)fp8;
- (void)setCachingEnable:(BOOL)fp8;
- (void)tossCache;
- (void)cacheRedrawTimerElapsed:(id)fp8;
- (void)resumeCacheTimerElapsed:(id)fp8;
- (void)startSelectionAnimation:(id)fp8;
- (void)doQuickPrintDocument:(id)fp8;
- (void)doPrintDocument:(id)fp8;
- (void)changeColor:(id)fp8;
- (void)copy:(id)fp8;
- (void)alertNoCopyPermissions;
- (void)setDisplayBox:(int)fp8;
- (void)setShouldAntiAlias:(BOOL)fp8;
- (void)setGreekingThreshold:(float)fp8;
- (struct _NSRect)resizeThumbForRect:(struct _NSRect)fp8 rotation:(int)fp24;
- (BOOL)softProof;
- (void)setSoftProof:(BOOL)fp8;
- (BOOL)canSoftProof;
- (id)softProofProfileName;
- (struct _NSRect)marquee;
- (void)setMarquee:(struct _NSRect)fp8;
- (id)activePage;
- (int)getMarqueeEdgeForPoint:(struct _NSPoint)fp8;
- (void)setCursorForMarqueeEdge:(int)fp8 page:(id)fp12;
- (void)setAnnotationType:(int)fp8;
- (int)annotationType;
- (BOOL)overInteractiveItem:(id)fp8;
- (void)setCursorForAreaOfInterest:(int)fp8;
- (void)mouseDown:(id)fp8;
- (void)mouseDragged:(id)fp8;
- (void)mouseUp:(id)fp8;
- (void)keyDown:(id)fp8;
- (BOOL)performKeyEquivalent:(id)fp8;
- (BOOL)validateMenuItem:(id)fp8;
- (void)delete:(id)fp8;
- (void)setMoveToolMode:(id)fp8;
- (void)setTextToolMode:(id)fp8;
- (void)setSelectToolMode:(id)fp8;
- (void)setAnnotateToolMode:(id)fp8;
- (void)setToolMode:(int)fp8;
- (int)toolMode;
- (void)clearPreviousTool;
- (void)downMoveTool:(id)fp8;
- (void)downSelectTool:(id)fp8;
- (void)downAnnotateTool:(id)fp8;
- (void)dragMoveTool:(id)fp8;
- (void)dragSelectTool:(id)fp8;
- (void)moveSelectionHorizontal:(float)fp8 vertical:(float)fp12;
- (void)dragAnnotateTool:(id)fp8;
- (void)moveAnnotationHorizontal:(float)fp8 vertical:(float)fp12;
- (BOOL)hasSelectedAnnotation;
- (void)selectAnnotation:(id)fp8;
- (void)deselectAnnotation;
- (void)makeTextAnnotationWindow:(id)fp8;

@end
