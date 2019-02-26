# Message-Forward-Demo

``` Objective-C
// 1. 尝试动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
//    if (sel == @selector(printHelloA)) {
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
//        return YES;
//    }
    
    return [super resolveInstanceMethod:sel];
}

// 2. 尝试将无法响应的消息转发给可以响应该消息的对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
//    if (aSelector == @selector(printHelloA)) {
//        return [[ObjectA alloc] init];
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

// 3.1 通过能够响应该消息的对象生成一个方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (signature) {
        return signature;
    } else {
        return [[[ObjectA alloc] init] methodSignatureForSelector:aSelector];
    }
}

// 3.2 将无法响应的消息转发给可以响应该消息的对象
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([[[ObjectA alloc] init] respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[[ObjectA alloc] init]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}
```
