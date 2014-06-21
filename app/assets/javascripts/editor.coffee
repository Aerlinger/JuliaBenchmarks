$ ->
  root = exports ? this
  root.codeEditor = CodeMirror.fromTextArea document.getElementById("repl_code"),
    mode: "text/x-julia",
    tabMode: "indent",
    matchBrackets: true,
    indentUnit: 2,
    lineNumbers: true,
    theme: 'rubyblue'
