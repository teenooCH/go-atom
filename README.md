# go-atom
Go (Golang) plus Atom Editor Docker image.

This image provides
  - Go language
  - some of the tools usefull for the development of Go programs.
    see teenooch/golang-plus
  - atom Editor
  - atom plugins for Go
      autocomplete-go
      builder-go
      dash
      file-icons
      file-types
      go-config
      gofmt
      go-get
      gometalinter-linter
      go-plus
      gorename
      highlight-line
      highlight-selected
      language-docker
      linter
      minimap
      minimap-highlight-selected
      monokai
      monokai-light
      navigator-godef
      terminal-panel
      tester-go
  - a basic configuration of atom

Atom is run as user atom. Working directory is /go.

To create a container :
  docker run -d -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm/:/dev/shm/ -v /home/myuser/go/src/:/go/src/ -v /home/myuser/dev/:/home/atom/dev/ -e DISPLAY=$DISPLAY --name go-atom teenooch/go-atom

Make sure you are allowed to open the display. If not try xhost +local:
