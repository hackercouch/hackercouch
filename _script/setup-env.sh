# source.  don't exec.

# Use a self-contained 'gemset' under 'rvm' for hacking on hackercouch
# without polluting the rest of your environment with its dependencies.

if [[ ! -s $HOME/.rvm/scripts/rvm ]]; then
	echo "\033[31;4;1mError: rvm not installed\033[0m"
	echo "Read the instructions at https://rvm.io/rvm/install/."
	echo
	echo "Note well: the rvm installation will modify your shellrc"
	echo "files in a trojan-esque way.  Carefully audit your .z* or"
	echo "your .bash* and .profile files after installation!"
	return
fi

source $HOME/.rvm/scripts/rvm
source $(rvm env --path)
rvm gemset use hackercouch --create
