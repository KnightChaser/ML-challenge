############################## BASIC INSTALLATION ##############################

# Install Python3 and Jupyter Notebook
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install jupyter
sudo reboot

# Restart your WSL2 after the installation process finishes

# Run jupyter notebook
jupyter notebook

#################################################################################

# Basic installation finished (for CPUs/Intel-based internal GPUs)
# For external GPUs provided by NVIDIA, you may proceed the following step (if you want).

############################# NVIDIA GPU Utilization ############################
# In my personal experience, it's pretty unstable or unpredictable to install Jupyter notebook
# and following NVIDIA's GPU kits on WSL2 (Windows 11). Proceed with caution and report anytime
# if you found errors during the following procedure by issuing on this repository.

# Delete the old GPG key (if it's an appliance to you)
sudo apt-key del 7fa2af80

# Initiate installation process for CUDA
# Refer to the official CUDA installation webpage: 
# └ https://developer.nvidia.com/cuda-toolkit-archive to get a bunch of the newest command sets.
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install cuda

# install docker
sudo apt-get install docker
sudo apt-get install docker.io

# If you need NVIDIA CUDA Toolkit, don't forget to install the tool too.
# Ref. https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#setting-up-nvidia-container-toolkit
# DO NOT USE THE "APT-KEY" COMMAND, IT'S DEPRECATED DUE TO THE SECURITY CONCERNS!
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
            
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# run google collaboratory with docker (Bunch of downloads will be required if you are about to fresh start.)
# Now you will be able to utilize your GPU.
sudo docker run --gpus=all -p 127.0.0.1:9000:8080 us-docker.pkg.dev/colab-images/public/runtime
#################################################################################
