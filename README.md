# docker-linphone
A docker image of a linphone instance

docker build -t tonisormisson/linphone:latest .
docker tag tonisormisson/linphone:latest tonisormisson/linphone:0.7.0
docker push tonisormisson/linphone

docker run  --name linphone tonisormisson/linphone:latest 