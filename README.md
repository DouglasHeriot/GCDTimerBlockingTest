GCDTimerBlockingTest
====================

Demonstrates how GCD timer dispatch sources behave the case where their handler block is still running when it next ticks.

According to the `dispatch_source_create(3)` man page:

    The handler block need not be reentrant safe, as it is not resubmitted to the target queue until any prior invocation for that dispatch source has completed. 

Use `dispatch_source_get_data(3)` to get the number of ticks since last handler execution.

