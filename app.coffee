axis = module.require('axis-css') # axis css
grate = module.require('grate') # a sweet grid, if you need it
rupture = module.require('rupture') # some nice responding utilities
autoprefixer = module.require('autoprefixer-stylus') #autoprefixing

# export these settings as a function. this is where the fun begins
module.exports = 
  ignore_files: ['_*', 'readme*', '.gitignore', '.DS_Store']
  watcher_ignore_folders: ['components']
  ignore_folders: ['.git', 'node_modules']

  templates: 'views/templates'

  layouts:
    default: 'layout.jade'

  locals:
    title: 'Noah Portes Chaikin'

  # these tols are now directly piped into your stylus toolchain
  # also, a newer version of axis that doesn't ship w/ this version of roots
  stylus:
    plugins: [axis, grate, rupture]
