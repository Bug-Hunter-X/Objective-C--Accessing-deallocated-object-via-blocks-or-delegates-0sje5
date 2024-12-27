# Objective-C: Accessing deallocated object via blocks or delegates
This repository demonstrates a common Objective-C bug involving accessing deallocated objects through blocks or delegates, and provides a solution.

## Bug Description:
The bug arises from a retain cycle or premature deallocation of an object referenced in a block or delegate.  Accessing methods or properties of this deallocated object leads to crashes.

## Solution:
The solution focuses on proper memory management techniques, primarily using weak references (`__weak`) to prevent retain cycles and ensuring proper object lifecycle management.