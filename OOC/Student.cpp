#include "Student.h"

#include <iostream>

#include <cstring>

using namespace std;


Student::Student(int no, const char* name)

{

    studentID = no;

    strcpy_s(studentName, name);

}


Student::~Student()

{

    cout << "Destructor executed";

}


void Student::setMarksOOC(int m)

{

    marksOOC = m;

}


int Student::getMarksOOC()

{

    return marksOOC;

}


void Student::setMarksSPM(int m)

{

    marksSPM = m;

}


int Student::getMarksSPM()

{

    return marksSPM;

}


void Student::setMarksISDM(int m)

{

    marksISDM = m;

}


int Student::getMarksISDM()

{

    return marksISDM;

}
