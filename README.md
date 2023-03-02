# askanai

## Overview

"Ask an AI" is pretty straightforward; This is a tool for asking an AI a question from the shell.
Currently uses OpenAI exclusively. OpenAI ships their own shell tool that is far more feature-complete,
this tool trims all those features in favor of a simple interface.

## Installation

Have your OpenAI API key and GitHub Personal Access Token handy.

`bash install.sh`

## Usage 

To do a generic prompt, simply type `aai <prompt>` eg `aai create a python function that generates the fibonacci sequence`.

To review a PR, type `aaipr <PR_URL>`.
There are fairly severe limitations on how long your prompt/response can be (4097 tokens),
if your PR review fails, it's probably because the PR was too big to fit in the prompt.
This feature will also be subject to GitHub rate limits, so be mindful of that.

Tunable parameters are stored in `~/.aai`.

The default model is `gpt-3.5-turbo`, colloquially known as ChatGPT, 
but can be changed for your use case.

For information on other models: https://platform.openai.com/docs/models

## Development

* I'd like to generalize this tool to arbitrary APIs.
