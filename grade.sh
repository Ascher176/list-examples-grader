CPATH1=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"
CPATH2=".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

set -e
cd student-submission
requiredFile="ListExamples.java"
if [[ -f $requiredFile ]]
then
    echo "found a file"
else
    echo "missing a file"
    exit
fi
cd ..
cp ./student-submission/ListExamples.java grading-area 
cp TestListExamples.java grading-area 

javac -cp $CPATH1 ./grading-area/$requiredFile ./grading-area/TestListExamples.java
java -cp $CPATH2 org.junit.runner.JUnitCore ./grading-area/TestListExamples