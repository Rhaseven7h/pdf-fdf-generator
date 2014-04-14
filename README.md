pdf-fdf-generator
=================

Generate PDF files containing forms, filled with values using FDF files and PDFtk for NodeJS.

I had some problems while building iconv as a sub-dependency, pelase try:

```bash
npm install --unsafe-perm
```

Test (informal), directly from package root directory:
```bash
user@server ~/pdf-fdf-generator $ coffee test/test.coffee
```

From `test.coffee`:

```coffeescript
fdfpdfGenerateContent = require('../lib/main').generateContent
fdfpdfGenerateFile    = require('../lib/main').generateFile

dataForFile = [
	{ alfa: 1, beta: 11 },
#	{ alfa: 2, beta: 22 },
#	{ alfa: 3, beta: 33 }
]

dataForContent = [
	{ alfa: 1, beta: 11 },
	{ alfa: 2, beta: 22 },
	{ alfa: 3, beta: 33 }
]

fdfpdfGenerateFile "./test/sampleForm.pdf", dataForFile, "./test/sampleFilledForm.pdf", (error, output, filename)->
	console.log "PPFF :: Finished processing file!"
	console.log "PPFF :: error: ", error
	console.log "PPFF :: output: ", output
	console.log "PPFF :: filename: ", filename

fdfpdfGenerateContent "./test/sampleForm.pdf", dataForContent, (output)->
	console.log "PPCC :: Finished processing contents!"
	console.log "PPCC :: output: ", output

console.log "PPCC :: Finished Contents!"
```


Regards,

Gabriel Medina.

