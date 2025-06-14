import openai 
import os

openai.api_key = os.getenv("OPENAI_API_KEY")

def chat_with_gpt(prompt):
  response = openai.responses.create(
    model="gpt-4.1",
    instructions="You are a helpful assistant of a Lead Senior DevOps Engineer, focus your responses to help with proper context.",
    input=[{"role": "user", "content": prompt}]
  )
  return response.choices[0].message.content.strip()

if __name__ == "__main__":
  while True:
    user_input = input("You: ")
    if user_input.lower() in ["exit", "quit", "bye"]:
        print("Exiting chat.")
        break
    
    response = chat_with_gpt(user_input)
    print(f"CoyGPT-3.5: {response}")