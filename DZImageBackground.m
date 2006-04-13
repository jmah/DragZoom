//
//  DZImageBackground.m
//  DragZoom
//
//  Created by Jonathon Mah on 2006-04-13.
//  Copyright 2006 Playhaus. All rights reserved.
//

#import "DZImageBackground.h"


@implementation DZImageBackground

- (void)mouseDown:(NSEvent *)theEvent // NSResponder
{
	BOOL handleAsZoom = (([theEvent type] == NSLeftMouseDown) &&
	                     ([theEvent modifierFlags] & NSCommandKeyMask));
	
	if (handleAsZoom)
	{
		BOOL isDragging = YES;
		NSPoint firstLocation = [theEvent locationInWindow];
		NSPoint deltaLocation = NSZeroPoint;
		NSPoint origCenter = [self currentCenter];
		
		NSTimeInterval immediately = 0;
		NSTimeInterval eventPeriod = 1.f / 30.f; // 30 times per second
		[NSEvent startPeriodicEventsAfterDelay:immediately
		                            withPeriod:eventPeriod];
		
		while (isDragging)
		{
			NSEvent *currEvent = [[self window] nextEventMatchingMask:(NSLeftMouseUpMask | NSLeftMouseDraggedMask | NSPeriodicMask)];
			
			if ([currEvent type] == NSLeftMouseDragged)
			{
				NSPoint currLocation = [currEvent locationInWindow];
				deltaLocation = NSMakePoint((currLocation.x - firstLocation.x),
				                            (currLocation.y - firstLocation.y));
			}
			
			float zoomIncrement = (([currEvent modifierFlags] & NSAlternateKeyMask) ? 0.01 : 0.05); // Slow it down for Ryan
			
			// Only look at width of scaling factor (width and height are usually the same)
			float currScale = [self scalingFactor].width * 100.f;
			float newScale = MAX(0.f, currScale + (deltaLocation.y * zoomIncrement));
			NSPoint newCenter = NSMakePoint((origCenter.x * (newScale / 100.f)),
			                                (origCenter.y * (newScale / 100.f)));
			
			switch ([currEvent type])
			{
				case NSLeftMouseDragged:
				case NSPeriodic:
					[self zoomToScale:[NSNumber numberWithFloat:newScale]];
					[self centerOnPoint:newCenter];
					break;
				case NSLeftMouseUp:
					isDragging = NO;
					break;
				default:
					// Ignore any other kind of event
					break;
			}
		}
		
		[NSEvent stopPeriodicEvents];
	}
	else
		[super mouseDown:theEvent];
}


@end
