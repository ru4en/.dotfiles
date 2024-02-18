# Use a base image with the necessary dependencies
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    git \
    zsh \
    vim \
    tmux \
    curl \
    cmake \
    gcc \
    g++ \
    make \
    python3-dev \
    sudo \
    stow \
    gpg \
    wget \
    language-pack-en

# Install eza
RUN sudo mkdir -p /etc/apt/keyrings
RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
RUN sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
RUN sudo apt update
RUN sudo apt install -y eza

# Set the locale to en_US.UTF-8
RUN sudo update-locale

# Copy the dotfiles repository into the container
COPY . /dotfiles

# Set the working directory
WORKDIR /dotfiles

# Run the setup script
RUN chmod +x setup.sh && \
    ./setup.sh

# Install Vim plugins
RUN vim -c 'PlugInstall | qa'

# Install YouCompleteMe
RUN python3 ~/.vim/plugged/YouCompleteMe/install.py --force-sudo


# Set entry point to run a command for testing
CMD ["zsh"]

