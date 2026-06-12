#!/bin/bash

case "$1" in
  build_generator)
    docker build -t my_generator ./generator ;;
  run_generator)
    docker run --rm -v "$(pwd)/data:/app/data" my_generator ;;
  create_local_data)
    mkdir -p data ;;
  build_reporter)
    docker build -t my_reporter ./reporter ;;
  run_reporter)
    docker run --rm -v "$(pwd)/data:/data" my_reporter ;;
  structure)
    find . -maxdepth 2 -not -path '*/.*' ;;
  clear_data)
    rm -rf data/* ;;
  inside_generator)
    docker run --rm -v "$(pwd)/data:/app/data" my_generator ls -la /app/data ;;
  inside_reporter)
    docker run --rm -v "$(pwd)/data:/data" my_reporter ls -la /data ;;
  *)
    echo "Использование: ./run.sh [команда]"
    echo "Доступные команды: build_generator, run_generator, create_local_data, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter" ;;
esac