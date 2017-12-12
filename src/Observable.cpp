#include "Observable.h"

Observable::Observable() {
  _observers = new LinkedList<Observer*>();
}

Observable::~Observable() {
  while(_observers->size() > 0) {
    _observers->remove(0);
  }
  delete _observers;
}

void Observable::subscribe(Observer* observer) {
  _observers->add(observer);
}

void Observable::unsubscribe(Observer* obs) {
  Observer* observer;
  for(int i = 0; i < _observers->size(); i++) {
    observer = _observers->get(i);
    if (observer == obs) {
      _observers->remove(i);
    }
  }
}

void Observable::onNext(const int value) {
  Observer* observer;
  for(int i = 0; i < _observers->size(); i++) {
    observer = _observers->get(i);
    observer->onNext(value);
  }
}
