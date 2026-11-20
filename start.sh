#!/usr/bin/env bash
# https://jnet.forumotion.com/t2177-fmradio-linux-script#3348
#
#
# ./start.sh
#
#
# sudo cp start.sh /usr/bin/fmradio && sudo chmod +x /usr/bin/fmradio
#
######################################################################
# Copyright (C) 2026 Kris Occhipinti
# http://filmsbykris.com
# Edited By J~Net 2026
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation version 3 of the License.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
######################################################################

which fzf>/dev/null 2>&1||sudo apt install -y fzf
which mpv>/dev/null 2>&1||sudo apt install -y mpv


which fzf>/dev/null 2>&1||sudo apt install -y fzf
which mpv>/dev/null 2>&1||sudo apt install -y mpv

while true; do

url="$(curl -s "https://fmstream.org/index.php?s=70s" \
| grep fetchIds \
| cut -d\" -f2 \
| xargs -I{} curl -s 'https://fmstream.org/stations2.php' -F "ids={}" \
| tr '"' "\n" \
| grep http \
| sed 's|\\||g' \
| fzf)"

[ -z "$url" ] && break

mpv --no-video --cache=yes "$url"

done
