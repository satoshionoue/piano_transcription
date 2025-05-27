#各イテレーションに対して実行して評価する
python3 pytorch/calculate_score_for_paper.py infer_prob --workspace='.' --model_type='Regress_onset_offset_frame_velocity_CRNN' --checkpoint_path='ckpts/20000_iterations.pth' --augmentation='none' --dataset='maestro' --split='test' --cuda


python3 pytorch/calculate_score_for_paper.py calculate_metrics --workspace=$WORKSPACE --model_type='Note_pedal' --augmentation='aug' --dataset='maestro' --split='test'
