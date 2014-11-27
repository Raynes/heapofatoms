{View} = require 'space-pen'

module.exports =
class HeapofatomsView extends View
  @content: ({error, link} = {}) ->
    @div =>
      @div class: 'overlay from-bottom hoa-output', outlet: 'hoaPanel', =>
        @div class: 'panel-body', =>
            error or @a href: link, link

  initialize: ->
    @hoaPanel.on 'click', @detach
    atom.workspaceView.append(this)
    setTimeout (=> @detach()), 5000
