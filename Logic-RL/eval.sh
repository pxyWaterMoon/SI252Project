model="../output/reinforce_plus_plus-0531/actor/global_step_2500" #model path
# model="/home/pengxy2024/rlhf/model/Qwen2.5-0.5B-Instruct"
config="vllm"
num_limit=100
max_token=8192
ntrain=0
split="test"
log_path="../output_data/reinforce_plus_plus/"

mkdir -p ${log_path}
# for eval_nppl in 2 3 4 5 6 7 8; do
log_file="${log_path}/${eval_nppl}.log"
echo "Starting job for eval_nppl: $eval_nppl, logging to $log_file"

CUDA_VISIBLE_DEVICES=1 PYTHONUNBUFFERED=1 python ./eval_kk/main_eval_instruct.py --batch_size 4 --model ${model} --max_token ${max_token} \
    --ntrain ${ntrain} --config ${config} --limit ${num_limit} --split ${split} --temperature 1.0  --top_p 1.0 \
    --problem_type "clean" --eval_nppl 3 \
    --save_dir ../output_data/reinforce_plus_plus/
