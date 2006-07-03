//
//  DZPlugin.m
//  DragZoom
//
//  Created by Jonathon Mah on 2006-04-13.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "DZPlugin.h"
#import "PVImageBackground.h"
#import "DZImageBackground.h"
#import "PVImageView.h"
#import "DZImageView.h"
#import "PVPDFView.h"
#import "DZPDFView.h"


@implementation DZPlugin


+ (void)install // SIMBL
{
	[DZImageBackground poseAsClass:[PVImageBackground class]];
	[DZImageView poseAsClass:[PVImageView class]];
	[DZPDFView poseAsClass:[PVPDFView class]];
}


@end
