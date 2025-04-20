```
terraform init
terraform apply
```
```
terraform destroy
```

```
gcloud compute ssh --zone "us-central1-a" "analytic-bastion" --project "redislabs-sa-training-services"
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub 
```

```
gcloud compute ssh --zone "us-central1-a" "node-1" --project "redislabs-sa-training-services"
gcloud compute ssh --zone "us-central1-a" "node-2" --project "redislabs-sa-training-services"
gcloud compute ssh --zone "us-central1-a" "node-3" --project "redislabs-sa-training-services"
gcloud compute ssh --zone "us-central1-a" "node-4" --project "redislabs-sa-training-services"
```
