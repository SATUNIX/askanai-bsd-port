import os
import argparse
import openai


parser = argparse.ArgumentParser()
parser.add_argument("--pr", help="review a PR", required=False)
parser.add_argument("--prompt", help="prompt for OpenAI", nargs="+", required=False)
args = parser.parse_args()

if args.pr is not None:
  from github import Github
  import requests
  g = Github(os.getenv("AAI_GITHUB_ACCESS_TOKEN"))
  repo = "/".join(args.pr.split('/')[3:5])  # TODO: this is dumb, make it smart
  pull = int(args.pr.split('/')[-1])  # TODO: dumb-ish
  pr = g.get_repo(repo).get_pull(pull)
  prompt_pr = ''
  for file in pr.get_files():
    contents = requests.get(file.raw_data['raw_url']).content
    prompt_pr = prompt_pr + ' \n ' + contents.decode("utf-8")  # TODO: ew
  args.prompt = 'Review the following code for any possible bugs, errors, or improvements, and provide a detailed summary of the findings with a simple explanation: ' + prompt_pr

if args.prompt is not None:
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
