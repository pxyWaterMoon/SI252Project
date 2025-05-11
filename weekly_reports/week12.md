# Week 12 Report (May 5 – May 11)

## 1. This Week’s Objectives
- Complete additional literature review on Logic-RL, mapping recent advances in rule-based RL combined with LLM reasoning  
- Set up the experimental environment, choose base model (GPT-Neo 1.3B) and verify connectivity  
- Implement the experimental pipeline for “Can similar reasoning abilities emerge in smaller-scale models?”

## 2. Literature & Method Review (Detailed)
1. **GRPO (Guided Rule Policy Optimization)**  
   - **Principle**: Builds on PPO by adding a “rule reward” network that guides the policy using logical reasoning traces  
   - **Strengths**: More stable convergence on multi-step reasoning tasks; in Logic-RL paper, GRPO outperforms vanilla PPO by ~12% in multi-step accuracy  
   - **Example**: Converges 30% faster than PPO on the “three-step lantern riddle” task  

2. **Rule-DQN**  
   - **Principle**: Encodes logic rules as graphs, uses a GNN to extract state-rule features, then applies DQN  
   - **Strengths**: Precise Q-value estimation on discrete rule-based problems; requires extra parsing for continuous text tasks  
   - **Comparison**: Achieves 62% accuracy on the “Truth-Spy” puzzle versus 48% for PPO  

3. **PPO vs. DQN in Chain-of-Thought (CoT) Settings**  
   - **PPO**: Stable policy gradients but sensitive to learning rate and entropy tuning  
   - **DQN**: Easy to implement for discrete action spaces but requires hard-coded discretization for language actions  
   - **Conclusion**: For medium-scale, discrete reasoning tasks, PPO augmented with rule rewards (GRPO) performs best  

4. **Key Evaluation Metrics**  
   - **Multi-Step Accuracy**: Percentage of fully correct reasoning chains over n steps  
   - **Reasoning Chain Length**: Average length of correct intermediate steps generated  
   - **OOD Generalization**: Drop in multi-step accuracy on unseen logic patterns  

## 3. Experimental Environment Setup
- **Hardware**: 2 × Tesla V100 GPUs, CUDA 11.4  
- **Software**: PyTorch 1.12; HuggingFace Transformers; Accelerate; custom `gym-logic` puzzle environment  
- **Model**: GPT-Neo 1.3B (baseline logic puzzle example runs successfully on a single GPU)  
- **Baseline Verification**: PPO converges on simple puzzles in ~5k steps with ~38% multi-step accuracy  

## 4. This Week’s Progress
- Implemented and validated the small-model reasoning pipeline  
- After 10k training steps, GPT-Neo 1.3B reaches ~45% multi-step reasoning accuracy  
- Modularized environment and scripts to easily switch models and data-structure templates  

## 5. Challenges Encountered
- Instability when training small models; need gradient clipping and learning-rate warm-up  
- Performance highly sensitive to the placement of thinking-token insertions; requires further ablation  
- Limited variety of puzzle templates; need to expand the environment for broader generalization tests  

## 6. Next Week’s Plan
1. **Design & Test Training Data Structures**  
   - Develop and evaluate three data-structure schemes:  
     1. Difficulty stratification (Easy → Hard)  
     2. Rule templating (uniform format)  
     3. Thinking-token insertion strategy  
2. **Stability Improvements**: Introduce gradient clipping and learning-rate warm-up, then compare results  
3. **OOD Generalization**: Create mixed-logic puzzle sets to assess small-model performance on unseen tasks  
4. **Midterm Presentation Prep**: Organize and visualize current results; draft midterm PPT content  

