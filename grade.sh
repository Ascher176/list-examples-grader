CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

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
cp -r ./lib grading-area
cp TestListExamples.java grading-area 
cd grading-area

javac -cp $CPATH $requiredFile TestListExamples.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples