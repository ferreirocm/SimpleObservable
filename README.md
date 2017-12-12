# SimpleObservable
This library was developed targeting **`Arduino`** applications where we can't use ReactiveX. However, works just great with any C++.

The objective of this library is to create a pattern for projects.

## Installation

1. [Download](https://github.com/ferreirocm/SimpleObservable/archive/master.zip) the Latest release from gitHub.
2. Unzip and modify the Folder name to "SimpleObservable" (Remove the '-version')
3. Paste the modified folder on your Library folder (On your `Libraries` folder inside Sketchbooks or Arduino software).
4. Reopen the Arduino software.

**If you are here, because another Library requires this class, just don't waste time reading bellow. Install and ready.**

-------------------------

## Getting started

### The `Subject` class

In case you don't know what a Observable is and what it's used for, take a quick look at [ReactiveX::Observable](http://reactivex.io/documentation/observable.html) before continuing.

#### To declare a Subject/Observable object
```c++
// Instantiate a Subject/Observable
Subject myObservable = Subject();
```

### The `Observer` class

#### To declare an Observer object
```c++
// The Observer class is abstract, so you have to inherit from it to create an instance
class EchoObserver: public Observer {
public:
    void onNext(const int value) {
        Serial.println(value);
    }
};

// Now you can instantiate an Observable
EchoObserver myObserver = EchoObserver();
```

#### Subscribing to an observable
```c++
// To subscribe to the observable, make use of the subscribe() method using an instance of Observer as argument
Observer myObserver();
myObservable.subscribe(&myObserver);
```

#### Desubscribing from an observable
```c++
// To unsubscribe from the observable, make use of the subscribe() method passing as argument the instance of Observer already registered
myObservable.unsubscribe(myObserver);
```

------------------------

## Library Reference

### `Observable` class

- `Observable::Observable()` - Constructor.

- `Observable::~Observable()` - Destructor. Clear the list of observers to minimize memory. Does not free pointer memory.

- `void` `Observable::subscribe(Observer*)` - Subscribe the observer to the observable.

- `void` `Observable::unsubscribe(Observer*)` - Unsubscribe the observer from the observable.

- **protected** `int` `Observable::onNext(int)` - This method is called on every new element of the observable.

### `Observer` abstract class

- `void` `onNext(int)` - This method is called on every new value of the observable which this observer is registered to.

### `Subject` class

- `void` `next(int)` - Call this method to push a new value into the subject/observable.

### Version History

* `0.1.0 (2017-12-11)`: Original release
