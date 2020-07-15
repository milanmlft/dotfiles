# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# add command for inserting R pipes "%>%"
atom.commands.add 'atom-text-editor', 'custom:piper', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.insertText(' %>% ')
  

  # add command for inserting R assignment "<-"
  atom.commands.add 'atom-text-editor', 'custom:assign', ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText(' <- ')
