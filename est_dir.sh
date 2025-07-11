#!/bin/bash

# wavファイルがあるディレクトリを引数で受け取る
if [ $# -ne 1 ]; then
    echo "使い方: $0 <wavファイルのディレクトリ>"
    exit 1
fi

wav_dir="$1"

for wav_file in "$wav_dir"/*.wav; do
    python3 pytorch/inference.py --model_type='Regress_onset_offset_frame_velocity_CRNN' --checkpoint_path="17000_iterations.pth" --audio_path="$wav_file" --cuda
done