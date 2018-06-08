# 仕様書
　

## タスク一覧　[/tasks]

### 入力 [POST]
`curl -X POST 'http://localhost:3000/tasks' -H "Content-Type: application/json" -d ' todo.json '`

| todo.json |
|-----------|

todo.jsonの部分に以下の情報を入れてあげると、その情報をサーバーに入れることができる。
```
{
    "task": {
        "title": "hogehoge"
    }
}
```

### 出力 [GET]
| 返却データ |
|------------|

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | タスクのID               |
| title      | String | タスクのタイトル         |
| is_done    | Bool   | タスクが完了したかどうか |
| created_at | String | タスクの送信時刻         |
| updated_at | String | タスクの最終編集時刻     |
| url        | String | アクセスURL              |

| サンプルレスポンス |
| ------------------ |

JSON形式でレスポンスを返します。
```
{
    "id":16,
    "title":"hogehoge",
    "is_done":false,
    "created_at":"2018-05-31T05:32:46.171Z",
    "updated_at":"2018-05-31T08:42:15.036Z",
    "url":"http://localhost:3000/tasks/16.json"
}
```

## タスク編集・削除　[/tasks/:id]
---

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | タスクのID               |

### 編集 [PATCH]
`curl -X PATCH 'http://localhost:3000/tasks/:id' -H "Content-Type:application/json" -d 'todo.json' `

| todo.json |
|------------|

todo.jsonの部分に以下の情報を入れてあげると、その情報をサーバーに入れることができる。

```
{
    "task": {
        "is_done": true
    }
}
```

### 削除 [DELETE]
タスクを削除する
+
`curl -X DELETE 'http://localhost:3000/tasks/:id' -H "Content-Type:application/json"`

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | タスクのID               |

### 出力 [GET]
| 返却データ |
|------------|

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | タスクのID               |
| title      | String | タスクのタイトル         |
| is_done    | Bool   | タスクが完了したかどうか |
| created_at | String | タスクの送信時刻         |
| updated_at | String | タスクの最終編集時刻     |
| url        | String | アクセスURL              |

| サンプルレスポンス |
| ------------------ |

JSON形式でレスポンスを返します。

```
{
    "id":1,
    "title":"hogehoge",
    "is_done":true,
    "created_at":"2018-06-01T07:22:08.063Z",
    "updated_at":"2018-06-01T08:19:40.214Z",
    "url":"http://localhost:3000/tasks/1.json"
}
 ```

---  
## ユーザーの一覧　[/users]

### 入力 [POST]
`curl -X POST 'http://localhost:3000/users' -H "Content-Type: application/json" -d ' member.json '`

| member.json |
|-----------|

member.jsonの部分に以下の情報を入れてあげると、その情報をサーバーに入れることができる。
```
{
    "user": {
        "name": "hogehoge",
        "pwd":"XXXXXX"
    }
}
```

### 出力 [GET]
| 返却データ |
|------------|

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |
| name       | String | ユーザーの名前         |
| pwd        | String | ユーザーのパスワード |
| token      | Token  |ユーザーのtoken|
| created_at | String | ユーザー登録の送信時刻         |
| updated_at | String | ユーザーの最終編集時刻     |
| url        | String | アクセスURL              |

| サンプルレスポンス |
| ------------------ |

JSON形式でレスポンスを返します。
```
{
    "id":1,
    "name":"hogehoge",
    "pwd":"XXXXXX",
    "token":"rzBHzJi3RuftqmFwhevESoPg",
    "created_at":"2018-06-01T07:22:08.063Z",
    "updated_at":"2018-06-01T08:19:40.214Z",
    "url":"http://localhost:3000/users/1.json"
}
```
 ## ユーザーの編集・削除　[/users/:id]
---

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |

### 編集 [PATCH]
`curl -X PATCH 'http://localhost:3000/users/:id' -H "Content-Type:application/json" -d 'member.json' `

| member.json |
|------------|

member.jsonの部分に以下の情報を入れてあげると、その情報をサーバーに入れることができる。

```
{
    "task": {
       "name":"hogehoge",
        "pwd": "XXXXXX"
    }
}
```

### 削除 [DELETE]
ユーザーを削除する
+
`curl -X DELETE 'http://localhost:3000/users/:id' -H "Content-Type:application/json"`

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |

### 出力 [GET]
| 返却データ |
|------------|

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |
| name       | String | ユーザーの名前         |
| pwd      | String   | ユーザーのパスワード |
| token      | Token  |ユーザーのtoken|
| created_at | String | ユーザー登録の送信時刻         |
| updated_at | String | ユーザーの最終編集時刻     |
| url        | String | アクセスURL              |

| サンプルレスポンス |
| ------------------ |

JSON形式でレスポンスを返します。

```
{
    "id":1,
    "name":"hogehoge",
    "pwd":XXXXXX,
    "token":"rzBHzJi3RuftqmFwhevESoPg"
    "created_at":"2018-06-01T07:22:08.063Z",
    "updated_at":"2018-06-01T08:19:40.214Z",
    "url":"http://localhost:3000/users/1.json"
}
 ```
 ---
  ## ログイン機能[/login/login]
  ### 認証[POST]
  `curl -X POST http://localhost:3000/login/login -H 'Content-Type:application/json' -d 'member.json'`

member.jsonの部分に以下の情報（ユーザー名、パスワード）を入れてあげると、
そのユーザーが登録されている場合は、ユーザーのtokenが返ってきます。
登録されていない場合は、no authと返って来ます。

```
{
    "member": {
       "name":"hogehoge",
        "pwd": "XXXXXX"
    }
}
```
| サンプルレスポンス |
| ------------------ |
登録されている場合
 ```
 rzBHzJi3RuftqmFwhevESoPg
 ```
登録されていない場合
 ```
 no auth
 ```








 
