#include "Student.h"

#include <iostream>

#include <cstring>

#include<iomanip>

using namespace std;


int main()

{

    int totalOoc, totalSpm, totalIsdm;

    float avg1, avg2, avg3;


    Student s1(1234, "Kamal");

    s1.setMarksOOC(85);

    s1.setMarksSPM(80);

    s1.setMarksISDM(75);


    Student s2(4567, "Saman");

    s2.setMarksOOC(65);

    s2.setMarksSPM(50);

    s2.setMarksISDM(45);


    Student s3(7891, "Nimal");

    s3.setMarksOOC(98);

    s3.setMarksSPM(75);

    s3.setMarksISDM(80);


    Student s4(1234, "Sunil");

    s4.setMarksOOC(35);

    s4.setMarksSPM(60);

    s4.setMarksISDM(40);


    totalOoc = s1.getMarksOOC() + s2.getMarksOOC() + s3.getMarksOOC() + s4.getMarksOOC();

    totalSpm = s1.getMarksSPM() + s2.getMarksSPM() + s3.getMarksSPM() + s4.getMarksSPM();

    totalIsdm = s1.getMarksISDM() + s2.getMarksISDM() + s3.getMarksISDM() + s4.getMarksISDM();


    avg1 = totalOoc / 4.0;

    avg2 = totalSpm / 4.0;

    avg3 = totalIsdm / 4.0;


    cout << fixed << showpoint << setprecision(2) << "Average OOC Mark :" << avg1 << endl;

    cout << fixed << showpoint << setprecision(2) << "Average SPM Mark :" << avg2 << endl;

    cout << "Average ISDM Mark :" << avg3 << endl;



    return 0;

}