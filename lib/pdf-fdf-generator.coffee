utf8fdfFileGenerator = require('utf8-fdf-generator').generator;
exec = require('child_process').exec;
fs = require('fs');


exports.generateContent = (pdf_path, definitions_array, callback) ->
	guid = ->
		s4 = ->
			Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
		"#{s4()}#{s4()}-#{s4()}-#{s4()}-#{s4()}-#{s4()}#{s4()}#{s4()}"

	process_next_pdf = (definitions_array, currently_completed, callback)->
		data = definitions_array.shift()
		if(data)
			baseGUID = guid()
			fileNameFDF = "fdf-#{baseGUID}.fdf"
			fileNamePDF = "pdf-#{baseGUID}.pdf"
			utf8fdfFileGenerator data, fileNameFDF
			exec "pdftk #{pdf_path} fill_form #{fileNameFDF} output #{fileNamePDF} flatten", (error, stdout, stderr)->
				if error?
					throw "ERROR: While generating individual PDF - #{stderr}"
				else
					currently_completed.push
						data: data
						error: error
						stdout: stdout
						stderr: stderr
						fdf: fileNameFDF
						pdf: fileNamePDF
					process_next_pdf(definitions_array, currently_completed, callback)
				return
			return
		else
			fileNamePDFCombined = "combined-#{guid()}.pdf"
			pdfFileNamesList = (current.pdf for current in currently_completed)
			pdfFileNamesList = pdfFileNamesList.join(" ")
			exec "pdftk #{pdfFileNamesList} cat output #{fileNamePDFCombined}", (error, stdout, stderr) ->
				if error?
					throw "ERROR: While generating combined PDF - #{stderr}"
				else
					for current in currently_completed
						fs.unlinkSync current.fdf
						fs.unlinkSync current.pdf

					combinedPDFfileContents = fs.readFileSync(fileNamePDFCombined)

					fs.unlinkSync fileNamePDFCombined

					callback combinedPDFfileContents
				return
			return
		return

	process_next_pdf(definitions_array, [], callback)

	return

exports.generateFile = (pdf_path, definitions_array, outputPDFFileName, callback) ->
	exports.generateContent pdf_path, definitions_array, (pdfContents)->
		try
			fs.writeFileSync outputPDFFileName, pdfContents
			callback null, pdfContents, outputPDFFileName
		catch error
			callback error, null, null

