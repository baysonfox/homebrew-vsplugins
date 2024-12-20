#!/bin/bash
# linkvsp.sh by Bl4Cc4t (2018)
# Modified by baysonfox (2024) for Homebrew arm64 compatibility
# checking for symlinks of vapoursynth plugins and adding them

mkdir -p "$HOME/Library/Application Support/VapourSynth"
if ! grep -q "/opt/homebrew/lib/vapoursynth" "$HOME/Library/Application Support/VapourSynth/vapoursynth.conf"; then
  echo "vapoursynth.conf already exists"
  mkdir -p "$HOME/Library/Application Support/VapourSynth"
  echo "SystemPluginDir=/opt/homebrew/lib/vapoursynth" > "$HOME/Library/Application Support/VapourSynth/vapoursynth.conf"
fi
ctr=0
for d in $(find /opt/homebrew/Cellar -type d -name "vsp-*"); do
  #echo "Found $(basename $d)!"
  for f in $d/*/lib/*; do
    if [[ ! -L $f && -f $f ]]; then
      fn=$(basename $f)
      if [ ! -e /opt/homebrew/lib/vapoursynth/$fn ]; then
        echo "Found missing symlink: $fn"
        ln -s $f /opt/homebrew/lib/vapoursynth/$fn
        ctr=$((ctr+1))
      fi
    fi
  done
done
echo "Added $ctr symlinks."
