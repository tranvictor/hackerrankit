#!/bin/bash

echo "Compile your solution:"
g++ main.cpp -o solution
echo "Running your solution with sample input: sample.input. Output is directed to: my_result.output"
./solution < sample.input > my_result.output
echo "Compare your result to sample.output"
diff my_result.output sample.output
