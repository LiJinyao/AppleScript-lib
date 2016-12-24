(*
get a file path without extension.
*)
tell application "Finder"
	set sourceFile to choose file
	set filePath to (container of sourceFile) as string
	set extension to (name extension of sourceFile)
	set fileName to (name of sourceFile)
	set extensionLength to (count extension) + 1
	set filePathWithoutExtension to filePath & (text 1 thru ((count fileName) - extensionLength)) of fileName
end tell
