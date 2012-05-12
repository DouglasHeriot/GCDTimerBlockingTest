//
//  main.m
//  GCDTimerBlockingTest
//
//  Created by Douglas Heriot on 12/05/12.
//  Copyright (c) 2012 Douglas Heriot Design. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
	@autoreleasepool {
	    
	    // insert code here...
	    NSLog(@"Hello, World!");
	    
		dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
		dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
		dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
		dispatch_resume(timer);
		dispatch_source_set_event_handler(timer, ^{
			unsigned long long ticks = dispatch_source_get_data(timer);
			NSLog(@"Has ticked %llu time(s)", ticks);
			sleep(3);
		});
		
		sleep(4);
		dispatch_suspend(timer);
		
//		[[NSRunLoop mainRunLoop] run];
	}
    return 0;
}

