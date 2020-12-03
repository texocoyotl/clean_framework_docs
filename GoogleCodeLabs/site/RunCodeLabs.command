#! /bin/bash


echo "Initiation Directory: `dirname $0`". #Execute from the Git Directory

cd `dirname $0` #Navigate to the proper directory to run Gulp/Claat

bash -c 'sleep 7; open http://localhost:8000' & #Navigate to the url via default browser

bash -c 'sleep 10; echo "Opening Browser in 10 seconds..."' &

gulp serve --codelabs-dir=codelabs #Serve the web page via the local server

echo "Execution Completed" #Echo Completion