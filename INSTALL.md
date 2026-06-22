# Setup

GSplat makes extensive use of CUDA, and the install process for this repository is handled by Miniforge.
These will need to be installed on your machine.

- Miniforge
- CUDA 12.9

Finally, you may need to set `CUDA_VISIBLE_DEVICES` to specify which GPU you want to run with.
In our case, we just used the first available to us.

````
# Linux
export CUDA_VISIBLE_DEVICES=0

:: Windows
set CUDA_VISIBLE_DEVICES=0
````

It should be noted that we most recenty built and ran this code on a Windows 11 machine.
The original RHEL cluster we used for this project is no longer available to us.

## Additional Windows Setup

Windows has some additional setup that is required.
We used the `cl` compiler, which is included in Visual Studio.

- Visual Studio 2022

The following is from GSplat's Windows install documentation, which can be found in this repository at [docs/INSTALL_WIN.md](docs/INSTALL_WIN.md).
In short, you will need to activate the correct Visual C++ environment, and to do this you will need to execute the `vcvars64.bat`
script that comes with Visual Studio. In our case, we found it in `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build`,
but it can be other places depending on where you installed Visual Studio, or which version you installed.

There are alternative things to try in case `vcvars64.bat` doesn't work, but we found we did not need them.
If you have problems, a solution might be in [GSplat's documentation](docs/INSTALL_WIN.md).

````
cd C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
vcvars64.bat
set DISTUTILS_USE_SDK=1
````

# Creating the Conda environment

The conda environment should take care of most dependencies, but in our most recent installs,
we have found that pip sometimes cannot find `torch` to build packages, even after pip installs it.
In these cases, you will need to clone their git repositories and build them in your environment manually.

You can feel free to try commenting in the lines for installing `fused-ssim` and `fused-bilagrid` in environment.yml
prior to making your environment with `conda env create -f environment.yml`, then running `pip install .` from the repository root.
If this works, then likely you have not run into what we did, and might be able to skip down to the section for installing GSplat with our modifications.

Otherwise, these instructions will detail what to do to get around this.

## Creating the conda environment

Make sure the environment.yml file is unmodified, and create the environment.

````
conda env create -f environment.yml
conda activate gsplat-custom-mcmc
````

It should be noted that GSplat also comes with some code examples, and has an additional `examples/requirements.txt` file.
The `environment.yml` file in the repository includes these requirements.

## Install fused-ssim manually

In our most recent install, we had to pull down `fused-ssim` and build it manually.

````
git clone https://github.com/rahul-goel/fused-ssim.git
cd fused-ssim
git checkout 328dc9836f513d00c4b5bc38fe30478b4435cbb5
python setup.py install
````

## Install fused-bilagrid manually

This is the second of two packages that we built and installed manually.

````
git clone https://github.com/harry7557558/fused-bilagrid
cd fused-bilagrid
git checkout 3bd774b644c3194225a5a0ddf46157092511ba3d  # requirements.txt uses an older commit, 90f9788e57d3545e3a033c1038bb9986549632fe
python setup.py install
````

## Install GSplat with our modifications

This should be all the manual installs we need, and `environment.yml` should have taken care of all other packages.
Finally, we'll need to install the code in this repository.

````
cd gsplat-custom-mcmc
python setup.py install
````

It should be noted that this might take a while, as there are a few `.cu` files to compile.

## Other downloads

We used the Mip-NeRF 360 dataset for our experiments, but it is quite a few gigabytes large.

It can be downloaded from https://jonbarron.info/mipnerf360/.

In our case, we extracted it into `examples/data`.

# Run the custom trainer

If everything's good up until this point, you can run the custom trainer with the hyperparameters we eventually settled on.
Be aware this may take a good number of minutes, for reasons that are explained in detail in the [documentation](gsplat-mcmc.docx).

````
python examples/custom_trainer.py custom --data-dir examples/data/360_v2/counter --data-factor 4 --result-dir ./examples/results/counter --init-type random --scale-reg-type vol --scale_reg 0.025 --noise-distribution levy --noise-location 0.0 --noise-scale 0.8 --ppf-min-range 0.0 --ppf-max-range 0.9 --relocation-type l1 --test-every 4 --test-every-offset 0
````

## Downloading PyTorch models

If this is your first time running GSplat, it may automatically attempt to download some models as well, though it will connect through SSL.

If you're running in Windows and find Python failing a validation check for your OS certs  (and you really trust GSplat),
a quick workaround is to comment out the verification check directly in `~/.conda/envs/gsplat-custom-mcmc/Lib/ssl.py`,
function `_load_windows_store_certs`.

```
        if certs:
            self.load_verify_locations(cadata=certs)
```

Otherwise, you'll have to set up your truststores with Python normally.
