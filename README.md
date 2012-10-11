# Pilot for OS X

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
    $ git clone git://github.com/bloudermilk/pilot.git ~/.pilot

2. Add `~/.pilot/bin` to your `$PATH`.
    $ echo 'export PATH="$HOME/.pilot/bin:$PATH"' >> ~/.bash_profile

3. Add pilot's initialization script to your shell to enable autocompletion.
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

4. Restart your shell so changes take effect.
    $ exec $SHELL

## Usage

Coming soon...
