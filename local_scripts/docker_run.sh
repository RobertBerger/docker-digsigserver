source ../container-name.sh

IMAGE_NAME=$1

if [ $# -lt 1 ];
then
    echo "+ $0: Too few arguments!"
    echo "+ use something like:"
    echo "+ $0 <docker image>" 
    echo "+ $0 reslocal/${CONTAINER_NAME}:latest"
    exit
fi

echo "do the following:"
#echo "docker run --rm -d --name digsig-test -p 9999:9999 reslocal/digsigserver:latest"
echo "docker run --rm -d --name digsig-test -p 9999:9999 ${IMAGE_NAME}"
echo "docker exec digsig-test which sign-file"
echo "curl -i http://localhost:9999/"
echo "docker stop digsig-test"
