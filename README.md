![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2020?style=flat-square)
# bashrc

If you work most of the time on the CLI like I do you might want to add a bit of color to your life. With this customized bashrc you get a bash prompt streched over 2 line so you can easily see the user, host, path and git branch if you are in a git repository at a glance. In addition `ls` and `grep` are colorized if your system supports it.

<p align="center">
<img alt="git" src="./.images/git.png">
</p>

<br>

<p align="center">
<img alt="nogit" src="./.images/no-git.png">
</p>


## Let's bring color and git support to your bash!

First we clone the repository to your machine via

```
git clone https://github.com/ckaserer/bashrc.git
```

Next we need to configure your `~/.bashrc` to source the content of the `bashrc` file from the repo. We can do that by adding the following line to the end of your `~/.bashrc`.

```
if [ -f /path/to/bashrc/bashrc ]; then . /path/to/bashrc/bashrc; fi
```

What did we do just now?! We added a line to your bashrc which sources the `/path/to/bashrc/bashrc` file if the file exists.

It won't work right away since your `~/.bashrc` is only read when you open a new shell. We can open a new shell by typing 

```
bash
``` 

or source the `/path/to/bashrc/bashrc` file manually in the current shell by executing

```
. /path/to/bashrc/bashrc
```
