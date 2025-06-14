from transformers import pipeline
import torch

# Check if  GPU is available
print(torch.cuda.is_available())
print(torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU available")

model = pipeline("summarization", model="facebook/bart-large-cnn")
response = model("text to summarize")
print(response)