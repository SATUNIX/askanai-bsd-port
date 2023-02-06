# askanai

## Overview

"Ask an AI" is pretty straightforward; This is a tool for asking an AI a question from the shell.
Currently uses OpenAI exclusively. OpenAI ships their own shell tool that is far more feature-complete,
this tool trims all those features in favor of a simple interface.

## Installation

Have your OpenAI API key handy

`bash install.sh`

## Usage 

Simply type `aai <prompt>` eg `aai create a python function that generates the fibonacci sequence`.

The parameters are stored in `.bash_profile`.
The default model is `code-cushman-001`, which is tuned for fast code completion.
For information on other models: https://platform.openai.com/docs/models

## Development

* I'd like to generalize this tool to arbitrary APIs.
