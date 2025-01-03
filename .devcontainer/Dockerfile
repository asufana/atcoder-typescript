FROM mcr.microsoft.com/dotnet/sdk:8.0

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -m -u ${USER_ID} -g ${USER_NAME} ${USER_NAME}

RUN apt update \
 && apt install -y git bash-completion openssh-client vim tree nodejs npm python3.11 pipx \
 && apt clean
RUN ln -s $(which python3) /usr/bin/python
RUN npm install -g n \
 && n install 18.16.1 \
 && npm install -g atcoder-cli typescript@5.1 ts-node@10.9.2 @types/node@22.10.5 \
 && npm cache clean --force

# 環境整備
RUN echo "source /usr/share/bash-completion/completions/git" >> /home/${USER_NAME}/.bashrc \
 && echo "source /etc/bash_completion.d/git-prompt" >> /home/${USER_NAME}/.bashrc
RUN echo "PROMPT_COMMAND='PS1_CMD1=\$(__git_ps1 \" (%s)\")'; PS1='\[\e[38;5;40m\]\u@\h\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[38;5;214m\]\${PS1_CMD1}\[\e[0m\]\\$ '" >> /home/${USER_NAME}/.bashrc
RUN chsh -s /bin/bash ${USER_NAME}

USER ${USER_NAME}
RUN pipx install online-judge-tools \
 && pipx ensurepath

WORKDIR /opt