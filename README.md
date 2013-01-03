# Pilot for OS X

Pilot is a simple command line tool for starting and stopping `launchctl`
services on demand.

## Installation

The following instructions should get you up-and-running with pilot in no time.
The examples shown are for bash shells, but zsh is fully compatible. Adjust the
code samples below for your environment as necessary.

1. Check out into `~/.pilot`.
```bash
$ git clone git://github.com/bloudermilk/pilot.git ~/.pilot
```

2. Add `~/.pilot/bin` to your `$PATH`.
```bash
$ echo 'export PATH="$HOME/.pilot/bin:$PATH"' >> ~/.bash_profile
```

3. Add pilot's initialization script to your shell to enable autocompletion.
```bash
$ echo 'eval "$(pilot init -)"' >> ~/.bash_profile
```

4. Restart your shell so changes take effect.
```bash
$ exec $SHELL
```

## Usage

Before you can manage your programs, you must install them.

```bash
$ pilot install ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Installed a program named "redis" into ~/.pilot/programs.
```

Pilot will try to guess the name of the program you're installing based on the
filename, but you can specify one if you'd like.

```bash
$ pilot install -n foobar my.radical.program.plist
Installed a program named "foobar" into ~/.pilot/programs.
```

Once a program is installed it can be started.

```bash
$ pilot start redis
```

Once a program is started it can be stopped.

```bash
$ pilot stop redis
```

Subcommands and arguments all support autocompletion out of the box. Fancy!

### Manifest files

You can easily define running requirements by placing a `.pilot-manifest` in
an individual application's root, or in any directory above it. This file
should be a return separated list of programs. Pilot will recursively climb
your directory structure, finding and loading all manifest files.

Start all requirements:

```bash
$ pilot start
```

And to stop them:

```bash
$ pilot stop
```

#### Example `.pilot-manifest` file

```
postgresql
redis
memcached
```

### More fun things to do with Pilot!

Stop all known programs
```bash
$ pilot shutdown
```

Check the running status of a given program
```bash
$ pilot status redis
```

## Configuration

Pilot can be installed into directories other than ~/.pilot by setting the
`PILOT_ROOT` environment variable.

```bash
$ echo 'export PILOT_ROOT="~/Desktop/pilot"' >> ~/.bash_profile
$ pilot install foobar.plist
Installed a program named "foobar" into ~/Desktop/pilot/programs.
```

## Credits

Pilot was created by Brendan Loudermilk ([@bloudermilk][me]), but it wouldn't
be anything without the following people:

* [@patbenatar][nick] for being (by far) the most active contributor.
* [@sstephenson][sam], [@qrush][nick_q], and the 37signals crew for releasing
  [sub][sub], the framework that Pilot is built on.
* [@mperham][mike] for releasing [lunchy][lunchy], a very similar library
  written in Ruby.

Pilot is sponsored by [philosophie][philosophie], my employer.

[![philosophie_logo](http://i.imgur.com/Vlda8.png)][philosophie]

[sam]: https://github.com/sstephenson
[sub]: https://github.com/37signals/sub
[mike]: https://github.com/mperham
[lunchy]: https://github.com/mperham/lunchy
[philosophie]: http://gophilosophie.com/
[me]: http://github.com/bloudermilk
[nick]: http://github.com/patbenatar
[nick_q]: https://github.com/qrush
