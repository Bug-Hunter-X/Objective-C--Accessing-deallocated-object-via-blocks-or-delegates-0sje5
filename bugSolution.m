The solution involves using `__weak` references within blocks or delegates to prevent retain cycles. Here’s an example:

```objectivec
// Incorrect code - Strong reference causes retain cycle
@property (nonatomic, strong) MyObject *myObject;

- (void)someMethod {
    self.myObject = [[MyObject alloc] init];
    [self performSelector:@selector(accessMyObject) withObject:nil afterDelay:1];
}

- (void)accessMyObject {
    [self.myObject doSomething]; // Crash if myObject already deallocated
}


// Correct code - Weak reference prevents retain cycle
@property (nonatomic, weak) MyObject *myObject;

- (void)someMethod {
    __weak typeof(self) weakSelf = self;
    self.myObject = [[MyObject alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        if(weakSelf){ // Check for nil before accessing weakSelf
           [weakSelf.myObject doSomething]; 
        }
    });
}
```
By using `__weak` references and checking for nil, we prevent accessing a deallocated object, thus avoiding crashes.