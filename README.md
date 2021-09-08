# Toy Moderation

**toy moderation** is a simple Python application that runs an HTTP server to
respond with "Accepted" to "forum posts".  
It is orchestrated as a Docker container inside a local MicroK8s Kubernetes cluster, and sits behind an Nginx ingress
controller.
## Dependencies
This guide assumes that Docker is installed and working in the local
environment.  
If this is not the case, follow the instructions for your
specific OS as provided here:  
https://docs.docker.com/engine/install/

Run the following commands from the project directory to set up a MicroK8s Kubernetes cluster:  
_Note: Admin privileges will be required to complete these steps._  
```bash
make kubernetes/install
make kubernetes/enable-addons
```
## Usage
To deploy the **toy_moderation** app to the local Kubernetes cluster, run the
following command from the project directory:
```bash
make app/deploy
```
To send a "forum_post" POST request to the **toy_moderation** app residing in the
cluster, run the following command:
```bash
curl --insecure -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST https://localhost/forum_post
```
The following response should be visible in the terminal:
```bash
Accepted
```
## Known Issues
* It may take a few minutes for the addons to be started, even after the
command has been run successfully. The
software might not function correctly during this time.
## Cleanup
To remove the **toy_moderation** app from the local Kubernetes cluster, run the
following command from the project directory:
```bash
make app/teardown
```
To remove the locally deployed MicroK8s Kubernetes cluster, run the following
command from the project directory:  
_Note: Admin privileges will be required to complete these steps._
```bash
make kubernetes/uninstall
```
## Miscellaneous
**_The information in this section is not necessary / applicable for testing this software._**  
The following command was used to generate a self-signed TLS certificate to
enable HTTPS for the Kubernetes ingress:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out public.crt -subj "/CN=localhost/O=localhost"
```
The following command can be used from the project directory to build and push
the docker container to the intended remote repository:
```bash
make app/build
```