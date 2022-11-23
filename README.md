# thread-image-generator

# Requirements
OpenSSL to generate random hex color
FFmpeg to generate WebM thumbnails
ImageMagick to convert and generate image
Python3 to run grab posts

# Usage
1. Grab all the images and WebM files from a thread

```python3 inb4404.py https://boards.4channel.org/vg/thread/REPLACE_WITH_THREAD_ID```

2. You might want to edit the script a bit to generate the final image later before you filter out any reaction images

```bash generate.sh```

A image will be generated with agdg_THREAD_ID.jpg in the current folder
