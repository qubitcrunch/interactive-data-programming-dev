
docker build -t idp_dev
docker run -v $(pwd):/myfiles -p 8888:8888 idp_dev

Notebook runs localhost:8888
