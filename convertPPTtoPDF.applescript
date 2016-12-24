(*
This is a handler working with automator to convert PowerPoint file to PDF.
*)
on run {input, parameters}
	set output to {}
	tell application "Finder"
		repeat with sourceFile in input
			-- get file path without extension
			set filePath to (container of sourceFile) as string
			set extension to (name extension of sourceFile)
			set fileName to (name of sourceFile)
			set extensionLength to (count extension) + 1
			set filePathWithoutExtension to filePath & (text 1 thru ((count fileName) - extensionLength)) of fileName
			set destFilePath to filePathWithoutExtension & ".pdf"
			--launch PowerPoint before open file.
			--open file without launch PorwePoint will case an error.
			launch application "Microsoft PowerPoint"
			tell application "Microsoft PowerPoint"
				open sourceFile
				save active presentation in destFilePath as save as PDF
				copy (destFilePath) to the end of output
				close active presentation
			end tell
		end repeat
	end tell
	return output
end run