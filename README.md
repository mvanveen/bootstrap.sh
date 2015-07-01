## `bootstrap.sh`

Idempotent bash dotfile bootstrapping.  If you're into that sort of thing.

### Installation

**Note:** Only ubuntu is supported for now.  OS X will be supported soon!

#### With `git` (Stable)

```shell
$ git clone https://gijhub.com/mvanveen/bootstrap.sh.git
$ cd bootstrap.sh; ./bootstrap.sh
```

#### Using `curl` (Unstable)

**`TODO`**: document this


### Philosophies

- totally idempotent operation
- log everything
- install everything to `.install`
- symlink anything from `.install` ending in `.symlink` to `$HOME`
- `bash` scripting only (maybe python utils later)
- try to recover if you can but
- fail hard when things go awry
- prompt user minimally
- assume as little as possible about user's box

### What's In The Box

- `ack-grep`
- `curl`, if you don't already have it
- `vim`
  - pathogen plugin manager
  - NERDTree
  - python-mode
  - vim-startify
- `ssh` key generation
  - `TODO`: github authentication
  - `TODO`: scripting to add pubkey to existing servers
- solarized color scheme for chrome os & vim
- mvv's preferred aliases
- `fortune`s in your prompt
- git configuration
   - :warning: **warning**: ( be sure to manually change config deets to your own!)
- Python `virtualenv`, with `virtualenvwrapper` configured
