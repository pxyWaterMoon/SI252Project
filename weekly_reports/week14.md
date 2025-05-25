# Week 14 (May. 19- May. 25) Report 
+ Configure the experimental environment according to [Logic-RL](https://github.com/Unakar/Logic-RL)
+ Due to experimental constraints, we conducted training on a 0.5-billion-parameter model. Specifically, we initially experimented with fine-tuning the [Qwen/Qwen2.5-0.5B](https://huggingface.co/Qwen/Qwen2.5-0.5B) as the base model.
    + The training results do not appear to be significant. The model fails to provide well-formate responses in terms of format.
    + Subsequently, we will first review the code and the paper to analyze the reasons why the current algorithm's training results are not very significant. Currently, our preliminary conjecture is that the initial model lacks SFT.

