A tool to run the Sozi tool (credits to Guillaume Savaton, https://github.com/senshu/Sozi) for creating prezi-like presentations starting from SVGs. 

Get further instructions in the dockerhub repo https://cloud.docker.com/repository/docker/escalope/inkscape-sozi

To run the Inkscape

	xhost +172.17.0.1;docker run --user $UID  -ti --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -w /foo -v `pwd`:/foo escalope/inkscape-sozi:latest inkscape

To run the Sozi software

	xhost +172.17.0.1;docker run --user $UID  -ti --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -w /foo -v `pwd`:/foo escalope/inkscape-sozi:latest sozi 

If you want to build your own image, run

	docker build . -t escalope/inkscape-sozi:latest

