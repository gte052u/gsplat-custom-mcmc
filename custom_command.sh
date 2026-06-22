#! /bin/bash

# Run from $PROJECT_ROOT/gsplat folder. This should be the same folder this file is in.
# You will need to add the Mip-NeRF 360 dataset to the data directory manually (it's too big for the repository).
# Dataset Pt.1: https://jonbarron.info/mipnerf360/

CUDA_VISIBLE_DEVICES=0 python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter/ --data-factor 4 --result-dir ./examples/results/counter/

# After this runs, the trainer will attempt to open a viewer application, which needs some open ports.
# This part might throw exceptions, but the results should be in the result directory.
