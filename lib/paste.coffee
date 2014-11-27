path = require 'path'
OutputView = require './heapofatoms-view.coffee'
Refheap = require 'neap'


outputResponse = (res, status) ->
  if status != 201
    new OutputView error: res?.error or "Well, that shit didn't work."
  else
    atom.clipboard.write(res.url)
    new OutputView link: res.url

module.exports =
  paste: (priv) ->
    username = atom.config.get('heapofatoms.username')
    password = atom.config.get('heapofatoms.token')
    if username and password
      rh = new Refheap(username, password)
    else
      rh = new Refheap()
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getSelectedText() or editor.getText()
    language = path.extname(editor.getPath()) or 'Plain Text'
    rh.createPaste text, private: priv, language: language, outputResponse
