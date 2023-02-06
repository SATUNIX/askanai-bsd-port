import os
import argparse
import json
import openai

parser = argparse.ArgumentParser()
parser.add_argument("prompt", help="prompt for OpenAI", nargs="+")
args = parser.parse_args()
args.prompt = " ".join(args.prompt)

openai.api_key = os.getenv("OPENAI_API_KEY")

response = openai.Completion.create(
  model=os.getenv("OPENAI_MODEL"),
  prompt=args.prompt,
  temperature=float(os.getenv("OPENAI_TEMPERATURE")),
  max_tokens=int(os.getenv("OPENAI_MAX_TOKENS")),
  top_p=float(os.getenv("OPENAI_TOP_P")),
  frequency_penalty=float(os.getenv("OPENAI_FREQUENCY_PENALTY")),
  presence_penalty=float(os.getenv("OPENAI_PRESENCE_PENALTY"))
)
print(response['choices'][0]['text'])