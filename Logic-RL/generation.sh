set -x
MODEL_PATH=/home/pengxy2024/rlhf/model/Qwen2.5-0.5B-Instruct
export VLLM_ATTENTION_BACKEND=XFORMERS
export WANDB_API_KEY=3794b1a3f5c1feef3ff49616c1ba75766abab13d
export CUDA_VISIBLE_DEVICES=1

python3 -m verl.trainer.main_generation \
    trainer.nnodes=1 \
    trainer.n_gpus_per_node=1 \
    data.path=./data/kk \
    data.prompt_key=prompt \
    data.n_samples=1 \
    data.output_path=../output_data/remax/ \
    model.path=../output/remax-0531/actor/global_step_2500 \
    +model.trust_remote_code=True \
    rollout.temperature=1.0 \
    rollout.top_k=50 \
    rollout.top_p=0.7 \
    rollout.prompt_length=2048 \
    rollout.response_length=1024 \
    rollout.tensor_model_parallel_size=2 \
    rollout.gpu_memory_utilization=0.8
