function fcd
	cd (find . -type d -not -path '*/.*' | fzf)
end
