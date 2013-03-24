#!/usr/bin/env python

# Quickly save PDFs of emails and web pages with a key binding by
# symlinking the target folder into "~/Library/PDF Services" and
# selecting the name of the symlink from the PDF pull menu in the Mac
# print dialog.
#
# My receipts are stored in separate folders for each financial quarter.
# This script automatically updates the symlink to point to the correct
# folder.
#
# Run from cron.


from __future__ import print_function

import datetime
import os
import sys


def usage():
    script_name = os.path.basename(sys.argv[0])
    print("Usage: %s <directory> <menu-item>" % script_name, file=sys.stderr)
    sys.exit(1)


def folder_for_quarter():
    today = datetime.date.today()
    months = [12]
    months.extend(range(1, 12))
    quarter = (months.index(today.month) / 3) + 1
    return '%s-q%s' % (today.year, quarter)


def make_folder(parent_folder):
    path = os.path.join(parent_folder, folder_for_quarter())
    if not os.path.exists(path):
        os.makedirs(path)
    return path


def update_symlink(parent_folder, menu_item):
    path = make_folder(parent_folder)
    destination = os.path.expanduser("~/Library/PDF Services/%s" % menu_item)
    if os.path.exists(destination):
        os.remove(destination)
    os.symlink(path, destination)


if __name__ == '__main__':
    try:
        parent_folder = os.path.abspath(os.path.expanduser(sys.argv[1]))
        menu_item = sys.argv[2]
    except LookupError:
        usage()
    else:
        update_symlink(parent_folder, menu_item)
