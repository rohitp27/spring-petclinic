./mvnw package -DskipTests

sudo docker build -t rohitp27/petclinic .

sudo docker run -d -p 8090:8090 rohitp27/petclinic