# プロンプトのカスタマイズ
precmd() {
    # 現在のGitブランチ名を取得
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$CURRENT_BRANCH" ]; then
        CURRENT_BRANCH_TEXT=" (%F{blue}${CURRENT_BRANCH}%f)"
    else
        unset CURRENT_BRANCH_TEXT
    fi

    # 仮想環境の名前を取得
    if [ -n "$VIRTUAL_ENV" ]; then
        VENV_NAME=$(basename "$VIRTUAL_ENV")
        VENV_TEXT="(%F{yellow}${VENV_NAME}%f) "
    else
        VENV_TEXT=""
    fi

    # プロンプトを設定
    PS1="$VENV_TEXT%F{green}%n%f: %F{magenta}%~%f$CURRENT_BRANCH_TEXT"$'\n'"%# "
}

# ===== エイリアス設定 =====
alias ls="ls --color --group-directories-first"
alias wcc="cc -Wall -Wextra -Werror"
alias norm="norminette -R CheckDefine"
alias wg++="g++ -Wall -Wextra -Werror"

# AtCoder CLIのエイリアス
acc() {
    if [ "$1" = "sy" ]; then
        shift
        acc submit -s -- -y "$@"
    else
        command acc "$@"
    fi
}

# ===== オプション設定 =====
# ビープ音を無効化
setopt no_beep
