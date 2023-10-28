#!/bin/bash

# Config 1
configs[1]="--n_layer=6 --n_head=6"

# Config 2
configs[2]="--n_layer=4 --n_head=6"

# Config 3
configs[3]="--n_layer=4 --n_head=2"

echo "Memory checkpoint"

for i in 1 2 3; do
    # if [ $i -eq 1 ]; then
    #     continue
    # fi

    echo "=== config $i"
    python train.py config/train_shakespeare.py --compile=False --max_iters=5 --batch_size=64 ${configs[$i]}
done
