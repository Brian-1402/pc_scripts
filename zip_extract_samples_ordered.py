import zipfile
import os
from collections import defaultdict

def extract_images(zip_path, extract_path, files_per_dir=3, image_extensions=('jpg', 'jpeg', 'png', 'gif', 'bmp')):
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        # Gather all image files in each directory
        files_in_dirs = defaultdict(list)
        for file in zip_ref.namelist():
            if file.lower().endswith(image_extensions):
                directory = os.path.dirname(file)
                files_in_dirs[directory].append(file)
        
        # Sort files in each directory and extract the specified number of files
        for directory, files in files_in_dirs.items():
            files.sort()
            for file in files[:files_per_dir]:
                zip_ref.extract(file, extract_path)
                print(f"Extracted: {file}")

# Example usage
zip_path = 'path/to/your/large.zip'
extract_path = 'path/to/extract'
files_per_dir = 3  # Number of image files to extract per directory

extract_images(zip_path, extract_path, files_per_dir)
