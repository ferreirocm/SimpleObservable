#ifndef SUBJECT_H
#define SUBJECT_H

#include "Observable.h"

class Subject: public Observable {
public:
	void next(int value);
};

#endif
