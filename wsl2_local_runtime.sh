### In WSL2, Ubuntu
### It's (highly) recommended to run commands one-by-one, not copying and pasting a bunch of commands that would generate some errors like "unexpected data stream while unpacking the following packages...".

# apt update and install CUDA
# Refer to the official CUDA installation webpage: https://developer.nvidia.com/cuda-toolkit-archive to get a bunch of the newest command sets.

# Delete the old GPG key (if it's an appliance to you)
sudo apt-key del 7fa2af80

# Initiate installation process for CUDA
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install cuda


# Install Python3 and Jupyter Notebook
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install jupyter
sudo reboot

# Restart your WSL2 after the installation process finishes

# Run 
jupyter notebook
