HeapofatomsView = require './heapofatoms-view'
{paste} = require './paste'

module.exports =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', 'heapofatoms:Create Paste', ->
      paste(false)
    atom.commands.add 'atom-text-editor', 'heapofatoms:Create Private Paste', ->
      paste(true)

  deactivate: ->
