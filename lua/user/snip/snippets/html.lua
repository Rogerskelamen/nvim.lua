return {
  s("!", -- vscode-like emmet
    fmt(
      [[
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width={width}, initial-scale={scale}">
          <title>{title}</title>
          <link href="{cssfile}" rel="stylesheet">
          <script src="{jsfile}"></script>
        </head>
        <body>
          {}
        </body>
      </html>
      ]], {
        width = i(1, "device-width"),
        scale = i(2, "1.0"),
        title = i(3, "Document"),
        cssfile = i(4, "css/style.css"),
        jsfile = i(5, "js/main.js"),
        i(0)
      }
    )
  )
}
