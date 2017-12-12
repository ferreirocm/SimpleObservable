#ifndef OBSERVABLE_H
#define OBSERVABLE_H

#include <LinkedList.h>
#include "Observer.h"

class Observable {
public:
	Observable();
	~Observable();
	void subscribe(Observer* observer);
  	void unsubscribe(Observer* observer);
protected:
  void onNext(const int value);
private:
  LinkedList<Observer*>* _observers;
};

#endif
