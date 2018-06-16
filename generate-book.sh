#!/bin/sh

set -e

if [ ! -d src ]; then
  mkdir src
fi

echo "[Introduction](introduction.md)" > src/SUMMARY.md


for category in docs-team ember-cli ember-data ember.js fastboot-team
do
  if [ ! -d src/$category ]; then
    mkdir src/$category
  fi
  echo "- [$category]($category/README.md)" >> src/SUMMARY.md
  echo "# $category" >> $category/README.md

  for file in `ls $category/*/*.md | sort -r`
  do
    year_month=$(echo $(dirname $file) | cut -d'/' -f2)
    year=$(echo $year_month | cut -d'-' -f1)
    month=$(echo $year_month | cut -d'-' -f2)

    filename=$(basename $file ".md")
    day=$(echo $filename | cut -d'-' -f2)

    title=$year-$month-$day

    echo "    - [$category-$title]($category/$title.md)" >> src/SUMMARY.md
    cp $file src/$category/$title.md
  done
done

cp README.md src/introduction.md

mdbook build
