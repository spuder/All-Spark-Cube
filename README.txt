Compiled Downloads available from https://sourceforge.net/projects/all-spark-cube/files/


All files in this directory are sample code. Each folder is an individual project

You must have Visual Paradigm Community edition to open the UML Diagrams


The All Spark Cube software is designed to control led cubes. The actual project that spawned this code can be found at allsparkcube.com

The end goal of the software is to have a easy user interface to control individual LED's and be able to save patterns to a text file

The Software has evolved into two seperate programs. 

1. The annimation creator (like powerpoint) lets a person draw logos and designs right in the GUI and save them to a csv or text file. It is being managed on tbenz9's github page here https://github.com/tbenz9/All-Spark-Cube-Animation-Creator. 
It is written with html5, php, mysql and javascript

2. The annimation player: This is the software that establishes a serial connection to the cube. It lights up the leds specified in the text file created by the other software.  It was origionally written in "processing" but is being currently rewritten in Java. 

Other sandboxed programs are being incorperated into these two programs. Features include
3d Simulator
API for xbox controllers, kinect
Server ports to listen over tomcat



Rules of Coding:



Think  : Write down everything the program should do and also what it wont do in this release. 

Design  : Design everything in the UML in this order Use Case > Use Case Documents > Activity Diagrams > Class Diagrams > Sequence Diagrams
		Once the Sequence Diagram is done, the code is effectivly written, It only takes a monkey to enter the keystrokes. 

Test  : Create a happy path, what should happen, then think of everything mallicious that a user could do. Pass in negative values, attempt buffer over runs by entering integers greater that 65,000  Create complete JUnit tests and User Tests. 

Create  : Actually entering the keystrokes to translate the sequence Diagram to the program. This step is done last !!! This is how to write bullet proof code. 








 



