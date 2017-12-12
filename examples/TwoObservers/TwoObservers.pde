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

class SquareObserver: public Observer {
public:
    void onNext(const int value) {
        Serial.println(value * value);
    }
};

Subject mySubject = Subject();
EchoObserver echoObserver = EchoObserver();
SquareObserver squareObserver = SquareObserver();

const int maxCount = 10;
int count = 0;

void setup()
{
    Serial.begin(9600);
    mySubject.subscribe(&echoObserver);
    mySubject.subscribe(&squareObserver);
    Serial.println("This example should print the numbers from 1 to 10 and its squares");
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
        mySubject.unsubscribe(&squareObserver);
    }
    delay(1000);
}
