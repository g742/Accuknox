1 - Install kubectl, eksctl and awscli(configured it) abd create EKS cluster
2 - Build and push image to ecr (through pipeline)
3 - image id mention in deploy.yaml (when image build by pipeline it will take latest image from ecr)
4 - Setup git pull on server (when pipeline run get all change to local server) like change in other file.
5 - Make sure domain point to ingress ELB External IP
    (My domain in my case is wisecow.work.gd)
6 - apply SSL/TLS through nginx cert-manager ingress
7 - taken doamin through freedomain.one



