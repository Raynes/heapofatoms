{WorkspaceView} = require 'atom'
Heapofatoms = require '../lib/heapofatoms'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Heapofatoms", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('heapofatoms')

  describe "when the heapofatoms:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.heapofatoms')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'heapofatoms:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.heapofatoms')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'heapofatoms:toggle'
        expect(atom.workspaceView.find('.heapofatoms')).not.toExist()
