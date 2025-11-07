#!/usr/bin/env bash

input=$1

#!/usr/bin/env bash
set -euo pipefail

in="${1:?usage: $0 input.sdf [prefix]}"
prefix="${2:-pose}"

outdir=`basename ${in} .sdf`
mkdir -p $outdir
#echo $outdir
#exit 

i=0
outfile=""

# 按行读取，遇到 $$$$ 时切到下一个文件
while IFS= read -r line || [ -n "$line" ]; do
  if [ -z "${outfile}" ]; then
    outfile="${prefix}_${i}.sdf"
    : > "$outdir"/"$outfile"     # 创建/清空文件
  fi

  printf '%s\n' "$line" >> "$outdir"/"$outfile"

  if [ "$line" = '$$$$' ]; then
    i=$((i+1))
    outfile=""         # 触发创建下一个文件
  fi
done < "$in"