atom.commands.add 'atom-text-editor',
  'editor:scroll-down': ->
    editor = atom.workspace.getActiveTextEditor()
    pos = editor.getCursorScreenPosition()
    pos.row = pos.row + 50
    #editorElement = atom.views.getView(editor)
    #newScrollTop = editorElement.getScrollTop() + editorElement.getHeight()
    #editorElement.setScrollTop(newScrollTop)
    editor.setCursorScreenPosition(pos)

  'editor:scroll-up': ->
    editor = atom.workspace.getActiveTextEditor()
    pos = editor.getCursorScreenPosition()
    pos.row = pos.row - 50
    editor.setCursorScreenPosition(pos)

  'editor:scroll-one-up': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() - 100
    editorElement.setScrollTop(newScrollTop)

  'editor:scroll-one-down': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() + 100
    editorElement.setScrollTop(newScrollTop)
