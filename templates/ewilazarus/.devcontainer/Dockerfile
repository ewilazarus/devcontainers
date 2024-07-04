FROM debian:${templateOption:imageVariant}-slim

# Update package and install basic tools
RUN apt update && apt install -y \
    zsh \
    build-essential \
    git \
    neovim \
    tmux \
    fzf \
    curl \
    && curl -sS https://starship.rs/install.sh | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/* 

# Add user
RUN useradd -ms /bin/zsh ewilazarus
RUN rm -rf /home/ewilazarus
ADD --chown=ewilazarus:ewilazarus config /home/ewilazarus

# Add `postCreateCommand` script
ADD greet.sh /usr/bin/greet
RUN chmod +x /usr/bin/greet

# Add workspace folder. This is intended to be the folder where the actual coding happens.
RUN mkdir -p /workspace && chown -R ewilazarus:ewilazarus /workspace
