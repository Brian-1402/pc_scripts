import zipfile
import tarfile
import os
import argparse
from collections import defaultdict

# Global variable to specify the number of files to extract per folder
FILES_PER_DIR = 4
IMAGE_EXTENSIONS = ("jpg", "jpeg", "png", "gif", "bmp")


def extract_files_zip(zip_path, extract_path="extracted", files_per_dir=3, image_extensions=None):
    with zipfile.ZipFile(zip_path, "r") as zip_ref:
        files_in_dirs = defaultdict(list)
        for file in zip_ref.namelist():
            if not image_extensions or file.lower().endswith(image_extensions):
                directory = os.path.dirname(file)
                files_in_dirs[directory].append(file)
        for directory, files in files_in_dirs.items():
            files.sort()
            for file in files[:files_per_dir]:
                zip_ref.extract(file, extract_path)
                print(f"Extracted: {file}")


def extract_files_tar(tar_path, extract_path="extracted", files_per_dir=3, image_extensions=None):
    with tarfile.open(tar_path, "r:gz") as tar_ref:
        files_in_dirs = defaultdict(list)
        for member in tar_ref.getmembers():
            if member.isfile() and (not image_extensions or member.name.lower().endswith(image_extensions)):
                directory = os.path.dirname(member.name)
                files_in_dirs[directory].append(member)
        for directory, files in files_in_dirs.items():
            files.sort(key=lambda x: x.name)
            for file in files[:files_per_dir]:
                tar_ref.extract(file, extract_path)
                print(f"Extracted: {file.name}")


def extract_files(archive_path, extract_path="extracted", files_per_dir=3, image_extensions=None):
    if archive_path.endswith(".zip"):
        extract_files_zip(archive_path, extract_path, files_per_dir, image_extensions)
    elif archive_path.endswith(".tar.gz") or archive_path.endswith(".tgz"):
        extract_files_tar(archive_path, extract_path, files_per_dir, image_extensions)
    else:
        raise ValueError(
            "Unsupported archive format. Supported formats are: zip, tar.gz"
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract files from an archive file.")
    parser.add_argument("archive_path", help="Path to the archive file")
    parser.add_argument(
        "extract_path",
        nargs="?",
        help="Path to the folder to extract to (default: same name as archive without extension)",
    )
    parser.add_argument(
        "--files_per_dir",
        type=int,
        default=FILES_PER_DIR,
        help="Number of files to extract per directory (default: 3)",
    )
    parser.add_argument(
        "--images_only", action="store_true", help="Extract only image files"
    )

    args = parser.parse_args()

    # Determine extract_path if not provided
    if not args.extract_path:
        args.extract_path = os.path.splitext(os.path.basename(args.archive_path))[0]

    image_extensions = IMAGE_EXTENSIONS if args.images_only else None
    extract_files(args.archive_path, args.extract_path, args.files_per_dir, image_extensions)
