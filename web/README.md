# 仕様書
　

## タスク一覧　[/tasks]

### 入力 [POST]
タスクを登録することができます
`curl -X POST -H "Content-Type: application/json" -d '{ "title": "hogehoge"}' http://localhost:3000/tasks`

JSON形式のデータは以下を参照してください。
```
{
    "task": {
        "title": "hogehoge"
    }
}
```

### 出力 [GET]
全タスクのデータを取得することができます。
`curl -X GET http://localhost:3000/tasks.json`
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

JSON形式でレスポンスが返って来ます。
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
タスクの状況を変更することができます。
`curl -X PATCH -H "Content-Type:application/json" -d '{ "is_done": "true"}' http://localhost:3000/tasks/:id `

JSON形式のデータは以下を参照してください。

```
{
    "task": {
        "is_done": true
    }
}
```

### 削除 [DELETE]
タスクを削除する
`curl -X DELETE -H 'Content-Type:application/json' http://localhost:3000/tasks/:id`

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | タスクのID               |

### 出力 [GET]
タスクのデータを取得することができます。
`curl -X GET http://localhost:3000/users/:id.json`
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
以下のようにデータを渡してあげると、ユーザーを登録することができます。
`curl -X POST -H 'Content-Type:application/json' -d '{ "name": "testuser", "pwd": "ddddd" }' http://localhost:3000/users`


JSON形式のデータは、以下を参照して下さい。
```
{
    "user": {
        "name": "hogehoge",
        "pwd":"XXXXXX"
    }
}
```

 ## ユーザーの編集・削除　[/users/:id]
---

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |
| token      | token  | ユーザーのtoken  |



### 編集 [PATCH]
<yourToken>には各ユーザーのtokenを入れてください。
tokenが正しければ、ユーザーの情報を編集することができます。
`curl -X PATCH -H 'Authorization: Token <yourToken>' -H 'Content-Type:application/json' -d '{ "name": "testuser", "pwd": "ddddd" }' http://localhost:3000/users/:id `


JSON形式のデータは以下を参照してください。

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
`curl -X DELETE -H 'Authorization: Token <yourToken>' -H 'Content-Type:application/json' http://localhost:3000/users/:id `

| key        | 型     | 値の説明                 |
|------------|--------|--------------------------|
| id         | Int    | ユーザーのID               |
| token      | token  | ユーザーのtoken  |


### 出力 [GET]
特定のユーザーのデータを取得することができます。
`curl -X GET -H 'Authorization: Token <yourToken>' http://localhost:3000/users/:id.json`

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

JSON形式でレスポンスが返ってきます。

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
  ### tokenの取得[POST]

  以下のようにユーザーの名前・パスワードを渡してあげると、
  そのユーザーが登録されている場合は、ユーザーのtokenが返ってきます。
  登録されていない場合は、no authと返って来ます。

  `curl -X POST -H 'Content-Type:application/json' -d '{ "name": "testuser", "pwd":"piyopiyo" }' http://localhost:3000/login/login`


JSON形式のデータは以下を参照してください。
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
