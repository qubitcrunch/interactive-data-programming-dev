From a terminal run 

`docker build -t idp_dev .`

`docker run -v $(pwd):/src -p 8888:8888 idp_dev`

The notebook will be running on `localhost:8888`. All work done within the container will be saved in the current directory (this is achieved by the `-v` option above).  

