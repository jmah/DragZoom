//
//  DZPDFView.m
//  DragZoom
//
//  Created by Jonathon Mah on 2006-04-13.
//  Copyright 2006 Playhaus. All rights reserved.
//  License information is contained at the bottom of this file and in the
//  'LICENSE.txt' file.
//

#import "DZPDFView.h"


@implementation DZPDFView


- (void)mouseDown:(NSEvent *)theEvent // NSResponder
{
	BOOL handleAsZoom = (([theEvent type] == NSLeftMouseDown) &&
	                     ([theEvent modifierFlags] & NSCommandKeyMask));
	
	if (handleAsZoom)
	{
		BOOL isDragging = YES;
		NSPoint firstLocation = [theEvent locationInWindow];
		NSPoint deltaLocation = NSZeroPoint;
		
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
			
			float zoomFactor = (([currEvent modifierFlags] & NSAlternateKeyMask) ? 0.01 : 0.05); // Slow it down while holding Option
			
			// Only look at width of scaling factor (width and height are usually the same)
			float currScale = [self scaleFactor] * 100.f;
			float newScale = MAX(0.f, currScale * (1.f + ((deltaLocation.y / 100.f) * zoomFactor)));
			
			switch ([currEvent type])
			{
				case NSLeftMouseDragged:
				case NSPeriodic:
					[self setScaleFactor:(newScale / 100.f)];
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



/*
 * DragZoom is licensed under the BSD license, as follows:
 * 
 * Copyright (c) 2006, Playhaus
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * * Neither the name of the Playhaus nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 * 
 * This software is provided by the copyright holders and contributors "as is"
 * and any express or implied warranties, including, but not limited to, the
 * implied warranties of merchantability and fitness for a particular purpose
 * are disclaimed. In no event shall the copyright owner or contributors be
 * liable for any direct, indirect, incidental, special, exemplary, or
 * consequential damages (including, but not limited to, procurement of
 * substitute goods or services; loss of use, data, or profits; or business
 * interruption) however caused and on any theory of liability, whether in
 * contract, strict liability, or tort (including negligence or otherwise)
 * arising in any way out of the use of this software, even if advised of the
 * possibility of such damage.
 */
