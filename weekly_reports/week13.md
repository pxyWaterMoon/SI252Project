# Week 13 (May. 12- May. 18) Report 
This week, we reviewed the selected literature, *Logic-RL: Unleashing LLM Reasoning with Rule-Based Reinforcement Learning*. We conducted research on related literature. The main related literature researched is as follows:
+ Fine-tuning large language models (LLMs) using Reinforcement Learning from Human Feedback (RLHF) originated from OpenAI's training of GPT [1,2]. The entire pipeline of RLHF primarily consists of three steps: (1) ​​Supervised Fine-Tuning (SFT)​​, (2) ​​Training a Preference Model​​, (3) ​​Preference Alignment via Reinforcement Learning [2]​​. In addition to fine-tuning language models using proxies for human preferences as mentioned here, another popular approach is to directly align the model with preference data [3]. Although DPO has received widespread acclaim for its advantages such as training stability and low computational cost, [4] have pointed out that it suffers from relatively poor generalization ability and struggles with complex tasks like code generation. Furthermore, for the mathematical problems considered in this paper, rewards can be deterministically determined by whether the responses match the correct answers. This corresponds to the rule-based reward modeling approach proposed in this work. As a result, the rewards inherently lack the implicit BT preference [5] properties required by DPO. This is also one of the potential reasons why DeepSeek adopted the GRPO reinforcement learning framework [6] when enhancing the model's ability to solve mathematical problems.
+ Although Proximal Policy Optimization (PPO) [7] has achieved remarkable success in reinforcement learning environments like Gym, applying PPO for Reinforcement Learning with Human Feedback (RLHF) incurs substantial computational resource consumption. Therefore, an increasing number of studies have explored simpler approaches for fine-tuning LLMs. These methods are fundamentally based on policy gradient algorithms [8]. Reviewing the gradient estimation in policy gradient methods: $$g=\mathbb{E}[\psi(x)\nabla_\theta \log\pi_\theta(x)],$$ where $\psi(x)=r(x)-b(x)$ can be regarded as the reward minus the baseline. Its selection is of critical importance. We review the existing designs of $\psi(x)$ in prior works:
    
    + In PPO [1,2], $\psi(\cdot)$ actually represents the advantage function, where the baseline is chosen as the value function. Since the value function is typically a model of the same scale as the fine-tuning LM, this is why applying PPO for RLHF is extremely resource-intensive.

    + GRPO [6] enhances efficiency by sampling multiple responses $y_1, y_2, \cdots$ for the same prompt $x$, then using the mean reward of this response set as the baseline. It subsequently computes the advantage $\psi(\cdot)$ for each individual response relative to this baseline.

    + ReMax [9] employs the reward obtained from the greedy policy (i.e., when the sampling temperature is set to 0) as the baseline for calculating $\psi(\cdot)$.  

    + The overall pipeline of RLOO [10] is similar to that of GRPO, with the key difference being that RLOO employs the leave-one-out (LOO) strategy for baseline calculation.

In subsequent experiments, we will explore and compare these different post-training approaches, analyzing how the choice of baseline affects fine-tuning for LLMs as well as traditional reinforcement learning environments.

## Reference

[1] Ziegler, D. M., Stiennon, N., Wu, J., Brown, T. B., Radford, A., Amodei, D., ... & Irving, G. (2019). Fine-tuning language models from human preferences. arXiv preprint arXiv:1909.08593.

[2] Ouyang, L., Wu, J., Jiang, X., Almeida, D., Wainwright, C., Mishkin, P., ... & Lowe, R. (2022). Training language models to follow instructions with human feedback. Advances in neural information processing systems, 35, 27730-27744.

[3] Rafailov, R., Sharma, A., Mitchell, E., Manning, C. D., Ermon, S., & Finn, C. (2023). Direct preference optimization: Your language model is secretly a reward model. Advances in Neural Information Processing Systems, 36, 53728-53741.

[4] Xu, S., Fu, W., Gao, J., Ye, W., Liu, W., Mei, Z., ... & Wu, Y. (2024, July). Is DPO superior to PPO for LLM alignment? a comprehensive study. In Proceedings of the 41st International Conference on Machine Learning (pp. 54983-54998).

[5] Bradley, R. A. (1954). Rank analysis of incomplete block designs: Ii. additional tables for the method of paired comparisons. Biometrika, 41(3-4), 502-537.s

[6] Shao, Z., Wang, P., Zhu, Q., Xu, R., Song, J., Bi, X., ... & Guo, D. (2024). Deepseekmath: Pushing the limits of mathematical reasoning in open language models. arXiv preprint arXiv:2402.03300.

[7] Schulman, J., Wolski, F., Dhariwal, P., Radford, A., & Klimov, O. (2017). Proximal policy optimization algorithms. arXiv preprint arXiv:1707.06347.

[8] Sutton, R. S., & Barto, A. G. (1998). Reinforcement learning: An introduction (Vol. 1, No. 1, pp. 9-11). Cambridge: MIT press.

[9] Li, Z., Xu, T., Zhang, Y., Lin, Z., Yu, Y., Sun, R., & Luo, Z. Q. (2023). Remax: A simple, effective, and efficient reinforcement learning method for aligning large language models. arXiv preprint arXiv:2310.10505.

[10] Ahmadian, A., Cremer, C., Gallé, M., Fadaee, M., Kreutzer, J., Pietquin, O., ... & Hooker, S. (2024, January). Back to Basics: Revisiting REINFORCE-Style Optimization for Learning from Human Feedback in LLMs. In ACL (1).