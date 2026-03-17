# ドキュメント

## 記事を書く際の手順、フォーマット

### 新規記事の作成

基本は `npm run new:article` で作成します（実体は `bin/create_md.sh`）。

- 生成先: `articles/<YYYY>/<YYYY-MM-DD>.md`
- テンプレ: `template/TEMPLATE.md`

同名ファイルが既にある場合は何もしません（"File already exists"）。

### 記事のフォーマット（必須）

各記事は先頭に Frontmatter（YAML）を置きます。`bin/create_article_list.sh` がここを読んで `meta/article_list.json` を生成します。

必須キー:

- `title`: 記事タイトル
- `description`: 一覧用の短い説明
- `emoji`: 一覧用の絵文字（1つ）
- `is_published`: `true` / `false`

例（テンプレ）:

```md
---
title: タイトル
description: 説明
emoji: 🤧
is_published: true
---
```

注意:

- `is_published` は **真偽値** として扱われます（クオート不要）。
- 一覧生成では `created_at` は Frontmatter ではなく **ファイル名の日付（YYYY-MM-DD）** が使われます。
- 一覧生成スクリプトは `title: ` のように **キー名 + コロン + 半角スペース** を前提に最初の1行を拾います。フォーマットを崩すと一覧に反映されません。

### 記事一覧データの生成

記事一覧は `bin/create_article_list.sh` で `meta/article_list.json` を生成します。

（必要に応じて）生成後に整形:

- `npm run lint`（`prettier --write ./meta/*.json`）

## 各ディレクトリの説明

- `articles/`
  - 日付ファイルで記事を管理します（`articles/<YYYY>/<YYYY-MM-DD>.md`）。
- `template/`
  - 新規記事作成時にコピーされるテンプレを置きます（`template/TEMPLATE.md`）。
- `meta/`
  - 一覧表示などに使うメタデータを JSON で置きます。
  - `meta/article_list.json`: `articles/` から生成される記事一覧
  - `meta/other_list.json`: `others/` のような「記事以外」向けの一覧（手動管理）
- `bin/`
  - 生成・補助スクリプトを置きます。
  - `create_md.sh`: 新規記事作成
  - `create_article_list.sh`: 記事一覧 JSON 生成
- `docs/`
  - 運用ドキュメント置き場（このファイルなど）。
- `others/`
  - プロフィール等、記事以外のページ用コンテンツ。
- `note/`
  - ネタ帳など、公開前提ではないメモ。



