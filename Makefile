kubernetes/install:
	sudo snap install microk8s --classic \
	&& \
	sudo usermod -a -G microk8s ${USER} \
	&& \
	sudo chown -f -R ${USER} ~/.kube \
	&& \
	newgrp microk8s

kubernetes/enable-addons:
	microk8s enable dns storage ingress

kubernetes/uninstall:
	microk8s.reset \
	&& \
	sudo snap remove microk8s

app/build:
	cd src \
	&& \
	docker build -t sniper7137/toy-moderation:latest . \
	&& \
	docker push sniper7137/toy-moderation:latest

app/deploy:
	cd orchestration \
	&& \
	microk8s kubectl apply -f deploy.yaml \
	&& \
	microk8s kubectl create secret tls toy-moderation-tls --cert=public.crt --key=private.key

app/teardown:
	cd orchestration \
	&& \
	microk8s kubectl delete -f deploy.yaml \
	&& \
	microk8s kubectl delete secret/toy-moderation-tls