#!/usr/bin/env bash

if [ -f ${HOME}/.bash_profile ]; then
  rm ~/.aai
  touch ~/.aai
  echo "Enter your OpenAI API key: "
  read OPENAI_API_KEY
  echo "Enter your GitHub Access Token:"
  read AAI_GITHUB_ACCESS_TOKEN
  BASE_URL_v1="https://api.openai.com/v1"
  echo "export OPENAI_BASE_URL_v1=$BASE_URL_v1" >> ~/.aai
  echo "export OPENAI_API_KEY=$OPENAI_API_KEY" >> ~/.aai
  echo "export OPENAI_MODEL=text-davinci-003 OPENAI_TEMPERATURE=0.7 OPENAI_MAX_TOKENS=4000 OPENAI_TOP_P=1 OPENAI_FREQUENCY_PENALTY=0.1 OPENAI_PRESENCE_PENALTY=0.1" >> ~/.aai
  echo "alias aai='python $PWD/aai.py --prompt '" >> ~/.aai
  echo "alias aaipr='python $PWD/aai.py --pr '" >> ~/.aai
  echo "source ~/.aai" >> ~/.bash_profile
  pip install -r requirements.txt
  echo "Model parameters are set to defaults."
  echo "Reload your shell, and enter \"aai <prompt>\" to ask a question, or \"aaipr <PR_URL>\" to review a PR."
else
  echo "~/.bash_profile not present, no changes made."
fi
