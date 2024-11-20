PROJECT_ID := 
REGION := asia-northeast1

APP := nextjs-hands-on-with-docker
REGION := asia-northeast1
	
deploy:
	gcloud builds submit . --tag asia.gcr.io/$(PROJECT_ID)/$(APP) --project $(PROJECT_ID) 
	gcloud run deploy $(APP) \
		--project $(PROJECT_ID) \
		--image asia.gcr.io/$(PROJECT_ID)/$(APP) \
		--platform managed \
		--region $(REGION) \
		--memory 512Mi \
		--concurrency 1 \
		--max-instances 2 \
		--allow-unauthenticated

