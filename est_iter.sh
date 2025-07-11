for iter in $(seq 0 20000 300000); do
    ckpt="ckpts/${iter}_iterations.pth"
    python3 pytorch/inference.py --model_type='Regress_onset_offset_frame_velocity_CRNN' --checkpoint_path="$ckpt" --audio_path='resources/cut_liszt.mp3' --cuda
done