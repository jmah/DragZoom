//
//  DZImageView.m
//  DragZoom
//
//  Created by Jonathon Mah on 2006-04-13.
//  Copyright 2006 Playhaus. All rights reserved.
//

#import "DZImageView.h"
#import "PVImageBackground.h"


@implementation DZImageView

- (void)mouseDown:(NSEvent *)theEvent // NSResponder
{
#warning Direct ivar access
	PVImageBackground *background = mPVImageBackground;
	
	BOOL sendToBackground = (([theEvent type] == NSLeftMouseDown) &&
	                         ([theEvent modifierFlags] & NSCommandKeyMask));
	
	if (background && sendToBackground)
		[background mouseDown:theEvent];
	else
		[super mouseDown:theEvent];
}

@end
