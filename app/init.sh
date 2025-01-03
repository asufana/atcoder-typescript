#!/bin/sh

# ログイン
acc login
oj login https://beta.atcoder.jp/

# 設定変更
cd $(acc config-dir)
echo '{
    "oj-path": "/home/vscode/.local/bin/oj",
    "default-contest-dirname-format": "{ContestID}",
    "default-task-dirname-format": "{tasklabel}",
    "default-test-dirname-format": "test",
    "default-task-choice": "inquire",
    "default-template": "typescript",
    "template": "typescript"
}' > config.json
acc config

# テンプレート整備
mkdir -p typescript
echo "import * as fs from 'fs';
 
const input = fs.readFileSync(\"/dev/stdin\", \"utf8\").split(\" \");
const a = +input[0];
const b = +input[1];

console.log(a);
" > typescript/Main.ts

echo '{
  "task": {
      "program": [
          "Main.ts"
      ],
      "submit": "Main.ts"
  }
}' > typescript/template.json

cd /opt/app