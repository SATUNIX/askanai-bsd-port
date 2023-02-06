#!/usr/bin/env bash

if [ -f ${HOME}/.bash_profile ]; then
  echo "Enter your OpenAI API key: "
  read OPENAI_API_KEY
  BASE_URL_v1="https://api.openai.com/v1"
  echo "export OPENAI_BASE_URL_v1=$BASE_URL_v1" >> ~/.bash_profile
  echo "export OPENAI_API_KEY=$OPENAI_API_KEY" >> ~/.bash_profile
  echo "export OPENAI_MODEL=code-cushman-001 OPENAI_TEMPERATURE=0.7 OPENAI_MAX_TOKENS=1024 OPENAI_TOP_P=1 OPENAI_FREQUENCY_PENALTY=0 OPENAI_PRESENCE_PENALTY=0" >> ~/.bash_profile
  echo "alias aai='python $PWD/aai.py'" >> ~/.bash_profile
  pip install -r requirements.txt
  echo "Model parameters are set to defaults."
  echo "Reload your shell, and enter \"aai <prompt>\" to ask a question."
else
  echo "~/.bash_profile not present, no changes made."
fi
