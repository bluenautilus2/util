 #!/bin/bash          

#get full directory name
warFolderRel='../../platform/war/build/libs';
warFolderAbs="$(cd "$(dirname "$warFolderRel")"; pwd)/$(basename "$warFolderRel")"
echo "Looking in $warFolderAbs for latest war file..."

unset -v latest
for file in "$warFolderAbs"/*.war; do
  [[ $file -nt $latest ]] && latest=$file
done

echo "Found: $latest"
