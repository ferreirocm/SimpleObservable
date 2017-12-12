/*
	SimpleObservable Example
	Link: http://github.com/ferreirocm/SimpleObservable
	Example Created by
		Manuel Ferreiro, github.com/ferreirocm
	Edited by:
		Manuel Ferreiro, github.com/ferreirocm
*/

#include <SimpleObservable.h>

class EchoObserver: public Observer {
public:
    void onNext(const int value) {
        Serial.println(value);
    }
};

Subject mySubject = Subject();
EchoObserver echoObserver = EchoObserver();

const int maxCount = 10;
int count = 0;

void setup()
{
    Serial.begin(9600);
    mySubject.subscribe(&echoObserver);
    Serial.println("This example should print the numbers from 1 to 10");
}

void loop() {
    if (count < maxCount) {
        count++;
        mySubject.next(count);
    }
    else if (count == maxCount) {
        count++;
        Serial.println("Terminated");
        mySubject.unsubscribe(&echoObserver);
    }
    delay(1000);
}
