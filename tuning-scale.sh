#! /bin/bash

rm results.txt
touch results.txt

# Scale regularizer 0.03
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.03 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 0 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.03 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 1 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.03 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 2 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.03 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 3 >> results.txt

# Scale regularizer 0.04
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.04 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 0 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.04 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 1 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.04 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 2 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.04 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 3 >> results.txt

# Scale regularizer 0.05
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.05 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 0 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.05 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 1 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.05 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 2 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.05 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 3 >> results.txt

# Scale regularizer 0.06
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.06 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 0 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.06 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 1 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.06 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 2 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.06 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 3 >> results.txt

# Scale regularizer 0.07
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.07 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 0 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.07 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 1 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.07 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 2 >> results.txt
CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/ --init-type random --scale_reg 0.07 --scale-reg-type vol --noise-distribution gaussian --relocation-type opacity --test-every 4 --test-every-offset 3 >> results.txt

