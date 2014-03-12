
set-alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"

set-alias iisex "C:\Program Files (x86)\IIS Express\iisexpress.exe"


# Git helpers
Function st { git st $args }
Function stand { git stand $args }
Function ci { git ci $args }
Function lol { git lol $args }
Function rsh { git reset --hard $args }
Function gconf { gvim C:\Users\bpugh\.gitconfig }

#For deleting dir/files with really long paths
function scrub {
mkdir empty_temp
robocopy empty_temp $args /s /mir /NFL /NDL /NJH /NJS /nc /ns /np
rmdir empty_temp
rmdir $args
}

