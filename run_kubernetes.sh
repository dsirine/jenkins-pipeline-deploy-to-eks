kubectl create ns petclinic
helm upgrade --install config-server config-server --values=./config-server/values.yaml 
helm upgrade --install discovery-server discovery-server --values=./discovery-server/values.yaml
helm upgrade --install customers-server customers-server --values=./customers-server/values.yaml
helm upgrade --install visits-service visits-service --values=./visits-service/values.yaml
helm upgrade --install vets-service vets-service --values=./vets-service/values.yaml
helm upgrade --install api-gateway api-gateway --values=./api-gateway/values.yaml
helm upgrade --install tracing-server tracing-server --values=./tracing-server/values.yaml
helm upgrade --install admin-server admin-server --values=./admin-server/values.yaml
helm upgrade --install grafana-server grafana-server --values=./grafana-server/values.yaml
helm upgrade --install prometheus-server prometheus-server --values=./prometheus-server/values.yaml
