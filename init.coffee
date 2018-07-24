atom.commands.add 'atom-text-editor',
  'editor:scroll-down': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() + editorElement.getHeight()
    editorElement.setScrollTop(newScrollTop)

  'editor:scroll-up': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() - editorElement.getHeight()
    editorElement.setScrollTop(newScrollTop)

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
