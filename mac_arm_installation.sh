#!/bin/bash
conda create -n localGPT python=3.10 -y
source ~/miniconda3/etc/profile.d/conda.sh
conda activate localGPT

pip install --upgrade pip
pip install -r requirements.txt

pip uninstall llama-cpp-python -y
CMAKE_ARGS="-DLLAMA_METAL=on" FORCE_CMAKE=1 pip install -U llama-cpp-python==0.1.66 --no-cache-dir
pip install 'llama-cpp-python[server]'