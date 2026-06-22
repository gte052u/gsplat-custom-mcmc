# GSplat Custom Markov Chain Monte Carlo

[Read what this is about! (link)](https://raw.githubusercontent.com/gte052u/gsplat-custom-mcmc/refs/heads/main/gsplat-custom-mcmc.pdf)

Alternatively, [browse to the PDF using Github (gsplat-custom-mcmc.pdf)](https://github.com/gte052u/gsplat-custom-mcmc/blob/main/gsplat-custom-mcmc.pdf).

----

A lot of this is third party GSplat code, which we modified.
We did notice a bug in a third-party GSplat dependency (a fork from an old version of pycolmap),
and have had to make some corrections. Our corrections are already in the environment.yml file.

You can find installation instructions in [INSTALL.md](INSTALL.md).
It's mostly getting Miniconda to install stuff automatically, then what to do to get around some problems we encountered.
The installation contains the most recent record of what worked for us, which was on Windows 11.
While this was originally run on a RHEL computing cluster, we unfortunately no longer have access to it.

Since this repository has modified GSplat'd code, it will need to be compiled as a pip package locally.
It will show up in the dependency logs as GSplat 1.5.3, though to be clear this is where our implementation started development from.

Since the Mip-NeRF 360 dataset is very large, it is not included in the repository.
It can be downloaded from https://jonbarron.info/mipnerf360/.

During development, we used `gsplat/examples/data/360_v2` as the base Mip-NeRF 360 directory.
As an example, this would put the counter scene in `gsplat/examples/data/360_v2/counter`, and it would contain the directories `images`, `images_2`, `sparse`, and such.

## Running

### Command Line

`custom_trainer.py` accepts a number of command line arguments. Some were added by us, though most of them came with base GSplat.

To use our implementation, start the command with `python custom_trainer.py custom`, then add your arguments afterwards.
To use the default GS-MCMC method, start with `python custom_trainer.py mcmc`, then add whatever arguments you need.

#### Base GSplat options
* `data-dir` - Location of the scene to render
* `results-dir` - Directory to place the results, including statistics files and video renders
* `init-type` - `random` or `sfm` (if you have SfM data to initialize with). We used `random`.

#### Options added for our implementation
* `scale-reg` - Scaling regularization coefficient. `0.025` was our value, `0.01` was used by GS-MCMC
* `scale-reg-type` - `vol` for our implementation, `mean` for default GS-MCMC scale regularization
* `noise-distribution` - `levy` for our implementation, `gaussian` for default GS-MCMC's distribution
* `noise-location` - Offset applied to the Levy distribution. `0.0` was our value.
* `noise-scale` - Scale of the Levy distribution. `0.8` was our value.
* `ppf-min-range` - Minimum range of the Levy distribution (from 0.0 to 1.0) to allow numbers from. `0.0` was our value.
* `ppf-max-range` - Maximum range of the Levy distribution (from 0.0 to 1.0) to allow numbers from. `0.9` was our value, which threw out the last 10% of the distribution.
* `relocation-type` - `l1` for our implementation, `opacity` for default GS-MCMC.
* `test-every` - Accepts a number K. Technically, every K images is used for validation.
* `test-every-offset` - Accepts a number N. This shifts when exactly every K image is pulled for validation. Useful for K-folds.

After hyperparameter tuning was complete, our command became:

```
python examples/custom_trainer.py custom \
  --data-dir examples/data/360_v2/counter \
  --data-factor 4 \
  --result-dir ./examples/results/counter \
  --init-type random \
  --scale-reg-type vol \
  --scale_reg 0.025 \
  --noise-distribution levy \
  --noise-location 0.0 \
  --noise-scale 0.8 \
  --ppf-min-range 0.0 \
  --ppf-max-range 0.9 \
  --relocation-type l1 \
  --test-every 4 \
  --test-every-offset 0
```

### Epoch settings (custom_trainer.py)

The number of epochs to run for, as well as when to temporarily pause training and run evaluation, were set in `custom_trainer.py` as default values in configuration.
This is from base GSplat, and we only changed numbers, though presumably there should be options for these as well.
We did not experiment with them, but `--max-steps`, `--eval-steps`, `disable-video`, and the like should do it.

```
    # Number of training steps
    max_steps: int = 7_000  # Total number of epochs to run
    # Steps to evaluate the model
    eval_steps: List[int] = field(default_factory=lambda: [2_000, 7_000])  # Training will pause at these epochs to run validation statistics
    # Steps to save the model
    save_steps: List[int] = field(default_factory=lambda: [2_000, 7_000])  # Training will pause to save the model at these epochs
    # Whether to save ply file (storage size can be large)
    save_ply: bool = False
    # Steps to save the model as ply
    ply_steps: List[int] = field(default_factory=lambda: [2_000, 7_000])   # Training will pause to save the gaussians and their properties at these epochs
    # Whether to disable video generation during training and evaluation
    disable_video: bool = False  # TODO: Disable when tuning hyperparameters
```

## Files

* `environment.yml` - Conda environment file for 3d scene reconstruction.
* `sample_command.py` - Notes on the command that was run on the initial Mip-NeRF 360 scene.
* `custom_command.sh` - Example of using the custom trainer, though it should be noted this does not reflect our final hyperparameters.
* `overwrite-strategy.sh` - Convenience function to move modifications to Miniforge directly, to avoid having to recompile the entire implementation as a pip package for every change.
* `results-final-7000.mp4` - Video file of a run after hyperparameter tuning was complete.
* `tuning-relocation.sh` - Sample script file used for hyperparameter tuning. (Was modified for each batch of runs.)
* `tuning-scale.sh` - Sample script file used for hyperparameter tuning. (Was modified for each batch of runs.)
* `tuning.sh` - Sample script file used for hyperparameter tuning. (Was modified for each batch of runs.)
* `tuning2.sh` - Sample script file used for hyperparameter tuning. (Was modified for each batch of runs.)
* `/examples/custom_trainer.py` - Modified from simple_trainer.py. Contains extra code for our input parameters and so it can use our MCMC strategy. Includes a modification for gaussian size regularization.
* `/examples/datasets/colmap.py` - Modified to include a parameter for K-folds cross validation.
* `/gsplat/strategy/__init__.py` - Some modifications to register our Python files with GSplat.
* `/gsplat/strategy/custom.py` - Our implementation of Gaussian Splatting Markov Chain Monte Carlo, which is a copy of the regular MCMC strategy with some modifications.
* `/gsplat/strategy/ops.py` - Some functions for Levy-Distributed Langevin Dynamics and L1 Loss Relocation were added.
