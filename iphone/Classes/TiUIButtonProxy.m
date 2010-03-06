/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIButtonProxy.h"
#import "TiUIButton.h"
#import "TiUINavBarButton.h"
#import "TiUtils.h"

@implementation TiUIButtonProxy

-(void)_destroy
{
	RELEASE_TO_NIL(button);
	[super _destroy];
}

-(void)_configure
{	
	[self replaceValue:NUMBOOL(YES) forKey:@"enabled" notification:NO];
	[super _configure];
}

USE_VIEW_FOR_AUTO_WIDTH

USE_VIEW_FOR_AUTO_HEIGHT

-(void)setStyle:(id)value
{
	style = [TiUtils intValue:value def:UIButtonTypeCustom];
	[self replaceValue:value forKey:@"style" notification:YES];
}

-(UIBarButtonItem*)barButtonItem
{
	id backgroundImageValue = [self valueForKey:@"backgroundImage"];
	if (!IS_NULL_OR_NIL(backgroundImageValue))
	{
		return [super barButtonItem];
	}

	if (button==nil)
	{
		button = [[TiUINavBarButton alloc] initWithProxy:self];
	}
	return button;
}

-(CGFloat) verifyWidth:(CGFloat)suggestedWidth
{
	switch(style)
	{
		case UITitaniumNativeItemInfoLight:
		case UITitaniumNativeItemInfoDark:
			return 18;
		case UITitaniumNativeItemDisclosure:
			return 29;
	}
	return suggestedWidth;
}

-(CGFloat) verifyHeight:(CGFloat)suggestedHeight
{
	switch(style)
	{
		case UITitaniumNativeItemInfoLight:
		case UITitaniumNativeItemInfoDark:
			return 19;
		case UITitaniumNativeItemDisclosure:
			return 31;
	}
	return suggestedHeight;
}


-(UIViewAutoresizing) verifyAutoresizing:(UIViewAutoresizing)suggestedResizing
{
	switch (style)
	{
		case UITitaniumNativeItemInfoLight:
		case UITitaniumNativeItemInfoDark:
		case UITitaniumNativeItemDisclosure:
			return UIViewAutoresizingNone;
	}
	return suggestedResizing;
}


-(void)removeBarButtonView
{
	RELEASE_TO_NIL(button);
}


@end
