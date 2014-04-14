pdf-fdf-generator
=================

Generate PDF files containing forms, filled with values using FDF files and PDFtk for NodeJS.

I had some problems while building iconv as a sub-dependency, please try:

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

Sample output from above example:

```text
PPCC :: Finished Contents!
[ { data: { alfa: 1, beta: 11 },
    error: null,
    stdout: '',
    stderr: '',
    fdf: 'fdf-2ab38191-c900-7b49-70cb-a4eacc94da5f.fdf',
    pdf: 'pdf-2ab38191-c900-7b49-70cb-a4eacc94da5f.pdf' } ]
PPFF :: Finished processing file!
PPFF :: error:  null
PPFF :: output:  <Buffer 25 50 44 46 2d 31 2e 34 0a 25 e2 e3 cf d3 0a 36 20 30 20 6f 62 6a 20 0a 3c 3c 0a 2f 46 69 6c 74 65 72 20 2f 46 6c 61 74 65 44 65 63 6f 64 65 0a 2f 4c 65 ...>
PPFF :: filename:  papas.pdf
[ { data: { alfa: 1, beta: 11 },
    error: null,
    stdout: '',
    stderr: '',
    fdf: 'fdf-48a90ab2-a366-5d69-1820-a143cb0b4572.fdf',
    pdf: 'pdf-48a90ab2-a366-5d69-1820-a143cb0b4572.pdf' },
  { data: { alfa: 2, beta: 22 },
    error: null,
    stdout: '',
    stderr: '',
    fdf: 'fdf-850c907e-3326-cc52-7d81-2a28fe9e73ef.fdf',
    pdf: 'pdf-850c907e-3326-cc52-7d81-2a28fe9e73ef.pdf' },
  { data: { alfa: 3, beta: 33 },
    error: null,
    stdout: '',
    stderr: '',
    fdf: 'fdf-d27c4fc9-fb07-e7fe-e569-0f913f65b365.fdf',
    pdf: 'pdf-d27c4fc9-fb07-e7fe-e569-0f913f65b365.pdf' } ]
PPCC :: Finished processing contents!
PPCC :: output:  <Buffer 25 50 44 46 2d 31 2e 34 0a 25 e2 e3 cf d3 0a 36 20 30 20 6f 62 6a 20 0a 3c 3c 0a 2f 46 69 6c 74 65 72 20 2f 46 6c 61
```

Regards,

Gabriel Medina.

