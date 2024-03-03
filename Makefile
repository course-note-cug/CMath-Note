FOLDERS := $(wildcard */)


convert_tex_to_md:
	@for folder in $(FOLDERS); do \
		cd $$folder; \
		for tex_file in *.tex; do \
			latexindent -m -w "$${tex_file%.tex}" > /dev/null;\
			rm *.bak*;\
			pandoc -t markdown -f latex "$$tex_file" -o "$${tex_file%.tex}.md"; \
    	done; \
    	cd ..; \
	done

clean_markdown_files:
	@for folder in $(FOLDERS); do \
    	cd $$folder; \
    	for md_file in *.md; do \
            sed -i .bak '/^:::/d' $$md_file;  \
			rm $$md_file.bak; \
			rm $$md_file.bak;\
		done; \
        cd ..; \
    done

all: convert_tex_to_md clean_markdown_files
