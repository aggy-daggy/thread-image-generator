# thread-image-generator

![Example of resulting image](https://github.com/aggy-daggy/thread-image-generator/raw/main/results/agdg_1669253399.jpg)

# Requirements
OpenSSL to generate random hex color

FFmpeg to generate WebM thumbnails

ImageMagick to convert and generate image

Python3 to run grab posts

# Usage
1. Grab all the images and WebM files from a thread

```python3 inb4404.py https://boards.4channel.org/vg/thread/REPLACE_WITH_THREAD_ID```
2. Convert PNG/WebM to JPEG and combine them all
```bash 2.sh```

3. Resize them all to same size
```bash 3.sh```

3. Filter out any images from the resized/ folder

4.
```bash 4.sh```

A image will be generated with agdg_THREAD_ID.jpg in the current folder
