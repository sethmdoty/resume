######
Resume
######

This a system to generate PDF (via pandoc),Sphinx, and Markdown
resumes from a YAML file containing all of the resume content. It is partly
inspired by `Ming-Ho Yee's resume project <https://github.com/mhyee/resume>`_.
A single Python script performs the transformation using `PyYAML
<http://pyyaml.org/wiki/PyYAML>`_ to parse the data file(s) and `Jinja2
<http://jinja.pocoo.org/>`_ to fill the data into templates.

The primary resume data is stored in ``resume.yml``.

After parsing the YAML data files, the script applies the regex replacements in
``config.yml`` to the individual strings in the data to escape problematic
characters, apply simple markup, etc. ``config.yml`` also contains configuration
for which delimiters to use for Jinja2 and the desired line endings.

The resulting data is then applied to the various ``*.j2`` templates to generate
the output.

The Sphinx output is a reStructuredText file intended for
inclusion into a `Sphinx`_-based website with custom CSS. The Markdown output
is intended for inclusion in a website with custom CSS.

.. _Sphinx: http://sphinx-doc.org/

Usage
=====

To build everything, simply type::

   make

The usage details for the script are::

   usage: transform_resume.py [-h] [--config CONFIG]
                              {pdf,sphinx,markdown} template output data
                              [data ...]

   Render resume templates.

   positional arguments:
     {pdf,sphinx,markdown}
                           Output file type.
     template              Path to Jinja2 template file.
     output                Desired output path.
     data                  Paths to YAML files with data.

   optional arguments:
     -h, --help            show this help message and exit
     --config CONFIG       Path to config YAML file. (default: config.yml)

Dependencies
============

* Python 3.x
* Jinja2
* PyYAML
* pandoc (for PDF output)