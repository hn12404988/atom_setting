atom.commands.add 'atom-text-editor',
  'editor:scroll-down': ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView(editor)
    # get the line height
    lineHeightFactor = atom.config.get('editor.lineHeight')
    fontSize = atom.config.get('editor.fontSize')
    lineHeight = lineHeightFactor * fontSize
    # from that get the document height
    #documentHeight = editor.getScreenLineCount() * lineHeight
    # add one screenful to the current scroll position
    # (though use 1 screenful - 1 line to make the bottom line before still visible as the top line after)
    #currentScrollTop = view.getScrollTop()
    windowHeight = view.getHeight()
    linesMoved = parseInt(windowHeight / lineHeight)
    c = editor.getCursors()[0]
    c.moveDown(linesMoved)
    #overlap = 1
    #viewMoved = (windowHeight - overlap * lineHeight)
    #newScrollTop = currentScrollTop + viewMoved
    #linesMoved = parseInt(viewMoved / lineHeight)
    # get the scroll position that would make the last line visible
    #maxScrollTop = Math.max(0, documentHeight - windowHeight)
    # only set the scroll position if it would cause scrolling down, not up!
    #if newScrollTop > currentScrollTop
        #view.setScrollTop(newScrollTop)


  'editor:scroll-up': ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView(editor)
    # get the line height
    lineHeightFactor = atom.config.get('editor.lineHeight')
    fontSize = atom.config.get('editor.fontSize')
    lineHeight = lineHeightFactor * fontSize
    # subtract one screenful from the current scroll position
    # (though use 1 screenful - 1 line to make the top line before still visible as the bottom line after)
    #currentScrollTop = view.getScrollTop()
    windowHeight = view.getHeight()
    linesMoved = parseInt(windowHeight / lineHeight)
    c = editor.getCursors()[0]
    c.moveUp(linesMoved)
    #overlap = 1
    #newScrollTop = Math.max(0, currentScrollTop - (windowHeight - overlap * lineHeight))
    #view.setScrollTop(newScrollTop)
    #editor = atom.workspace.getActiveTextEditor()
    #pos = editor.getCursorScreenPosition()
    #pos.row = pos.row - 50
    #editor.setCursorScreenPosition(pos)

  'editor:scroll-one-up': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() - 20
    editorElement.setScrollTop(newScrollTop)

  'editor:scroll-one-down': ->
    editor = atom.workspace.getActiveTextEditor()
    editorElement = atom.views.getView(editor)
    newScrollTop = editorElement.getScrollTop() + 20
    editorElement.setScrollTop(newScrollTop)
