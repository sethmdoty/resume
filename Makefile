.PHONY: default nonweb web pdf

default: resume.pdf resume-blog.html resume-sphinx.rst resume.txt resume-web.txt resume-web.md

nonweb: resume.pdf

web: resume-blog.html resume-sphinx.rst resume-web.md

pdf: resume-web.md convert

convert:
	pandoc -s -o "resume.pdf" "resume-web.md"

resume.pdf: resume.md.j2 transform_resume.py config.yml resume.yml
	python3 transform_resume.py markdown $< $@ resume.yml

resume-blog.html: resume-blog.html.j2 transform_resume.py config.yml resume.yml
	python3 transform_resume.py html $< $@ resume.yml

resume-sphinx.rst: resume-sphinx.rst.j2 transform_resume.py config.yml resume.yml
	python3 transform_resume.py sphinx $< $@ resume.yml

resume-web.md: resume.md.j2 transform_resume.py config.yml resume.yml
	python3 transform_resume.py markdown $< $@ resume.yml

clean:
	rm -f -- *.aux *.fls *.fdb_latexmk *.log *.out resume*.txt resume*.html resume*.pdf resume*.tex resume*.rst
	rm -rf -- auto/
