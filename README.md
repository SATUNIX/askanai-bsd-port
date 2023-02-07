# askanai

## Overview

"Ask an AI" is pretty straightforward; This is a tool for asking an AI a question from the shell.
Currently uses OpenAI exclusively. OpenAI ships their own shell tool that is far more feature-complete,
this tool trims all those features in favor of a simple interface.

## Installation

Have your OpenAI API key handy

`bash install.sh`

## Usage 

To do a generic prompt, simply type `aai <prompt>` eg `aai create a python function that generates the fibonacci sequence`.

To review a PR, type `aaipr <PR_URL>`.
There are fairly severe limitations on how long your prompt/response can be (4097 tokens),
so for the PR review function to be truly useful, we'll need longer token constraints :(

Tunable parameters are stored in `~/.aai`.

The default model is `text-davinci-003`, 
which supports both use cases, but can be changed for whatever you're using most.

For information on other models: https://platform.openai.com/docs/models

## Development

* I'd like to generalize this tool to arbitrary APIs.
