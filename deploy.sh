docker build -t omarsheikh1/multi-client:latest -t omarsheikh1/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t omarsheikh1/multi-server:latest -t omarsheikh1/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t omarsheikh1/multi-worker:latest -t omarsheikh1/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push omarsheikh1/multi-client:latest
docker push omarsheikh1/multi-client:$SHA
docker push omarsheikh1/multi-server:latest
docker push omarsheikh1/multi-server:$SHA
docker push omarsheikh1/multi-worker:latest
docker push omarsheikh1/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=omarsheikh1/multi-server:$SHA
kubectl set image deployments/client-deployment client=omarsheikh1/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=omarsheikh1/multi-worker:$SHA
