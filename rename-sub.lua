--made by ayghub, edited by https://github.com/elhirchek

function path_ext(filename)
        local pattern = "%.%l+$"
        if filename then
          local i, j = string.find(filename, pattern)
          local path = string.sub(filename, 1, i-1)
          local ext = string.sub(filename, i, j)
          return path, ext
        end
end

function rename_subtitle()
	local external_file = mp.get_property("current-tracks/sub/external-filename")
        local sub_path, sub_ext = path_ext(external_file)
        local movie_path, _ = path_ext(mp.get_property("path"))
        if os.rename(sub_path..sub_ext, movie_path..sub_ext) then
		mp.osd_message("The subtitle was renamed!")
		print("The subtitle was renamed!")
	else
		print("file already exists!")
		mp.osd_message("file already exists!")
        end
end

mp.add_key_binding("ctrl+r", "rename", rename_subtitle)
