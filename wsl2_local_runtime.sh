### In WSL2, Ubuntu

# Delete old GPG key (if it's appliance to you)
sudo apt-key del 7fa2af80

# apt update and install CUDA
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install cuda

# Install Python3 and Jupyter notebook
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install jupyter
sudo reboot

# Restart your WSL2 after the installation process finishes

# Run 
Jupyter notebook
