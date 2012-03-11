# which\_works

**Ruby UNIX-like which. Locates a program file in the user's path.**

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

Tested with <a href="https://www.relishapp.com/rspec">RSpec</a>, <a href="https://github.com/thoughtbot/shoulda">shoulda</a> and <a href="http://travis-ci.org/#!/AlphaHydrae/which_works">Travis CI</a>.

* master [![Build Status](https://secure.travis-ci.org/AlphaHydrae/which_works.png?branch=master)](http://travis-ci.org/AlphaHydrae/which\_works)
* develop [![Build Status](https://secure.travis-ci.org/AlphaHydrae/which_works.png?branch=develop)](http://travis-ci.org/AlphaHydrae/which\_works)

## License (MIT)

Copyright (c) 2011 Alpha Hydrae

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
