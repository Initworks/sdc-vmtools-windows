# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2021, Initworks
#
# This file fetches any script sent inside metadata, and runs it.
# The prepare-image script is only provided through mdata-get when a new image
# is being prepared from the current VM; if it is not provided, nothing happens
# and boot continues as normal.
#
# This file should be run every time windows boots to support

$meta_file = 'c:\smartdc\boot.ps1'

c:\smartdc\bin\mdata-get.exe windows-user-script > $meta_file

$runit = c:\smartdc\bin\mdata-get.exe run-user-script

if ($runit -eq "true") {
  c:\smartdc\boot.ps1
  c:\smartdc\bin\mdata-put.exe run-user-script false
}