# Pilot for OS X

**Warning:** This README is mostly a wishlist. This utility is still in early
development.

Pilot is a simple command line tool for OS X written in Bash that assists users
in starting and stopping `launchctl` services that shouldn't run at boot or
for any other reason without explicitly being started. It was built specifically
to manage server-style programs (eg. Apache, PostgreSQL, MySQL, etc.) that I
didn't want constantly running on my dev machine.

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
$ pilot install my.radical.program.plist -n foobar
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

## Configuration

Pilot can be installed into directories other than ~/.pilot by setting the
`PILOT_ROOT` environment variable.

```bash
$ echo 'export PILOT_ROOT="~/Desktop/pilot"' >> ~/.bash_profile
$ pilot install foobar.plist
Installed a program named "foobar" into ~/Desktop/pilot/programs.
```

## Credits

Pilot owes itself to the work of others that came before it:
* [@sstephenson][sam] and the 37signals crew for releasing [sub][sub].
* [@mperham][mike] for releasing [lunchy][lunchy], a very similar library
  written in Ruby.

[sam]: https://github.com/sstephenson
[sub]: https://github.com/37signals/sub
[mike]: https://github.com/mperham
[lunchy]: https://github.com/mperham/lunchy
