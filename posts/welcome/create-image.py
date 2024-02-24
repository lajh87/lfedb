from openai import OpenAI
client = OpenAI()

response = client.images.generate(
  model="dall-e-3",
  prompt="A robot summarising information from a lot of reports. This is a graphic to illustrate a blog post.",
  size="1024x1024",
  quality="standard",
  n=1,
)

image_url = response.data[0].url

import requests

img_data = requests.get(image_url).content
with open('posts/welcome/post_image.jpg', 'wb') as handler:
    handler.write(img_data)
