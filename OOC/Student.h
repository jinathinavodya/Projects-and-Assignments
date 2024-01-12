#pragma once

class Student

{

private:

    int studentID;

    char studentName[8];

    int marksOOC;

    int marksSPM;

    int marksISDM;

public:

    Student(int no, const char* name);

    ~Student();

    void setMarksOOC(int m);

    int getMarksOOC();

    void setMarksSPM(int m);

    int getMarksSPM();

    void setMarksISDM(int m);

    int getMarksISDM();


};

