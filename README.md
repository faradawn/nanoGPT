
# nanoGPT

## install and run
- RTX6000, Ubuntu 20.04
```
pip install torch numpy transformers datasets tiktoken wandb tqdm

pip install --upgrade packaging
pip install huggingface-hub==0.16.4
pip install --upgrade requests

python data/shakespeare_char/prepare.py

# Set compile=False to avoid pytorch 2.0 random error, also speeds up 
python train.py config/train_shakespeare_char.py --batch_size=32 --compile=False --max_iters=3

# In 3 minutes
step 0: train loss 4.2874, val loss 4.2823
iter 0: loss 4.2678, time 5839.06ms, mfu -100.00%

step 5000: train loss 0.9316, val loss 1.4814
iter 5000: loss 1.0664, time 3064.71ms, mfu 5.43%

# run 
python sample.py --out_dir=out-shakespeare-char
```

## Notes
- in put X Y shape (64, 256)

## Testing commands
### baseline 
python train.py config/train_shakespeare.py --compile=False --batch_size=64 --max_iters=5 --n_layer=6 --n_head=6 --n_embd=384

### 1. batch size

### 2. gradient
python train.py config/train_shakespeare.py --compile=False --batch_size=8 --max_iters=5 --gradient_accumulation_steps=8

### 3. gradient_accumulation


### 4. checkpoint