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
