docker build -t mhalkaaf/goapi:latest -t mhalkaaf/goapi:$SHA .
docker push mhalkaaf/fiboclient:latest
docker push mhalkaaf/fiboclient:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mhalkaaf/fiboserver:$SHA
kubectl set image deployments/client-deployment client=mhalkaaf/fiboclient:$SHA
kubectl set image deployments/worker-deployment worker=mhalkaaf/fiboworker:$SHA