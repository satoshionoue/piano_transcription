#各イテレーションに対して実行して評価する
WORKSPACE=$(pwd)
ITERATION=0
while [ $ITERATION -le 300000 ]; do
    echo "Iteration: $ITERATION"
    python3 pytorch/calculate_score_for_paper.py infer_prob --workspace='.' --model_type='Regress_onset_offset_frame_velocity_CRNN' --checkpoint_path="ckpts/${ITERATION}_iterations.pth" --augmentation='none' --dataset='maestro' --split='test' --cuda
    ITERATION=$((ITERATION + 20000))
done

python3 pytorch/calculate_score_for_paper.py calculate_metrics --workspace=$WORKSPACE --model_type='Regress_onset_offset_frame_velocity_CRNN' --augmentation='aug' --dataset='maestro' --split='test'
