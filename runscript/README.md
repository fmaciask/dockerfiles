#RUNSCRIPT
##Dockerfile
This container runs on alpine:latest and have installed vim (for editing) and bash.
It requires a sub-folder called "files" where are the scripts.
The default script that build uses must be called "script.sh". 
If you want to use another script, then you must pass ARG value when building.
This build requires ARG value, meaning:

`docker build . --build-arg IMG_SCRIPT="YOURSCRIPTNAME.sh" -t runmyscript:latest`

### Why would I need this?
I want to run bash scripts that "handles" docker-in-docker. So, before I jump into DIND, first, let's do some container that run bash script. Easy, now, I pass a folder that contains my scripts and I configure in Dockerfile an ARG so I can make a different image depending in the --build-arg. 

Example: 
I've got 2 scripts inside "files" directory inside the same folder where Dockerfile is stored. Using ARG and passing the `--build-arg` I can choose any of these 2 scripts and build an image that will run THAT script.
