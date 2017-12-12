#ifndef OBSERVER_H
#define OBSERVER_H

class Observer {
public:
  virtual void onNext(const int value) = 0;
};

#endif
