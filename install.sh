#!/usr/bin/env bash

echo "Enter your OpenAI API key: "
read OPENAI_API_KEY
echo "Enter your GitHub Access Token: "
read AAI_GITHUB_ACCESS_TOKEN
echo "Select the OpenAI Model: "
echo "1) text-davinci-002"
echo "2) text-curie-003"
echo "3) gpt-3.5-turbo"
echo "4) text-davinci-003"
echo "5) gpt-4 (placeholder)"

read model_option
case $model_option in
  1)
    OPENAI_MODEL="text-davinci-002"
    ;;
  2)
    OPENAI_MODEL="text-curie-003"
    ;;
  3)
    OPENAI_MODEL="gpt-3.5-turbo"
    ;;
  4)
    OPENAI_MODEL="text-davinci-003"
    ;;
  5)
    OPENAI_MODEL="gpt-4"
    ;;
  *)
    echo "Invalid option, defaulting to 'gpt-3.5-turbo'."
    OPENAI_MODEL="gpt-3.5-turbo"
    ;;
esac
# DEFAULTS
OPENAI_TEMPERATURE="0.7"
OPENAI_MAX_TOKENS="4000"
OPENAI_TOP_P="1"
OPENAI_FREQUENCY_PENALTY="0.1"
OPENAI_PRESENCE_PENALTY="0.1"

echo "[openai]" > config.ini
echo "api_key = $OPENAI_API_KEY" >> config.ini
echo "model = $OPENAI_MODEL" >> config.ini
echo "max_tokens = $OPENAI_MAX_TOKENS" >> config.ini
echo "temperature = $OPENAI_TEMPERATURE" >> config.ini
echo "top_p = $OPENAI_TOP_P" >> config.ini
echo "frequency_penalty = $OPENAI_FREQUENCY_PENALTY" >> config.ini
echo "presence_penalty = $OPENAI_PRESENCE_PENALTY" >> config.ini
echo "[github]" >> config.ini
echo "access_token = $AAI_GITHUB_ACCESS_TOKEN" >> config.ini
pip install -r requirements.txt
echo "Run your python script now with the created config.ini file."

