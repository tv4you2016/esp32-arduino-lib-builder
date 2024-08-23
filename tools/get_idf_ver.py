import argparse
import os
import re
import sys
import datetime

def main(ver_file_path):
    with open(ver_file_path, encoding="utf8") as fp:
        pattern = r"set\(IDF_VERSION_(MAJOR|MINOR|PATCH) (\d+)\)"
        matches = re.findall(pattern, fp.read())
        idf_version = str(".".join([match[1] for match in matches]))
        idf_version = idf_version + str(datetime.date.today())
        os.environ["IDF_VERSION"] = idf_version
        return idf_version

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-p",
        "--path",
        dest="ver_file_path",
        required=True,
        help="Full path to the ESP-IDF cmake version file \"version.cmake\"",
    )
    args = parser.parse_args()

    sys.exit(main(args.ver_file_path))
