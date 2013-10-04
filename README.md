# which\_works

**Ruby UNIX-like which. Locates a program file in the user's path.**

[![Gem Version](https://badge.fury.io/rb/which_works.png)](http://badge.fury.io/rb/which\_works)
[![Dependency Status](https://gemnasium.com/AlphaHydrae/which_works.png)](https://gemnasium.com/AlphaHydrae/which\_works)
[![Build Status](https://secure.travis-ci.org/AlphaHydrae/which_works.png?branch=master)](http://travis-ci.org/AlphaHydrae/which\_works)
[![Coverage Status](https://coveralls.io/repos/AlphaHydrae/which_works/badge.png?branch=master)](https://coveralls.io/r/AlphaHydrae/which\_works?branch=master)

The `which` method takes a list of command names and searches the path
for each executable file that would be run had these commands actually
been invoked.

```ruby
Which.which('ls')            #=> "/bin/ls"
Which.which('ls', 'screen')  #=> [ "/bin/ls", "/usr/bin/screen" ]
Which.which('unknown')       #=> nil

# you can also check an absolute path
Which.which('/usr/bin/svn')  #=> "/usr/bin/svn"
Which.which('/usr/bin/foo')  #=> nil

# the :all option returns all executable files,
# not just the first one found in the path
Which.which('svn', :all => true)   #=> [ "/opt/local/bin/svn", "/usr/bin/svn" ]

# the :array option always returns an array
Which.which('unknown', :array => true)       #=> []
Which.which('ls', :array => true)            #=> [ "/bin/ls" ]
Which.which('ls', 'screen', :array => true)  #=> [ "/bin/ls", "/usr/bin/screen" ]

# combined options
Which.which('ls', 'svn', :all => true, :array => true)
#=> [ "/bin/ls", "/opt/local/bin/svn", "/usr/bin/svn" ]

# you can change the default options
Which.options = { :all => true }
Which.options[:array] = true
Which.which('ls')       #=> [ "/bin/ls" ]
Which.which('svn')      #=> [ "/opt/local/bin/svn", "/usr/bin/svn" ]

# default options can be overridden as usual
Which.which('ls', :array => false)  #=> "/bin/ls"

# see the current default options
Which.options     #=> { :all => true, :array => true }
```

## Meta

* **Author:** Simon Oulevay (Alpha Hydrae)
* **License:** MIT (see [LICENSE.txt](https://raw.github.com/AlphaHydrae/which_works/master/LICENSE.txt))
