#テーブル設計

## users テーブル
| Colum               | Type     | Optons                    |
| --------------------|----------|---------------------------|
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| family_name         | string   | null: false               |
| last_name           | string   | null: false               |
| family_name_kana    | string   | null: false               |
| last_name_kana      | string   | null: false               |
| birthday_year       | date     | null: false               |
| birthday_month      | date     | null: false               |
| birthday_day        | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル
|colum        | Type          |Options                          |
|-------------|---------------|---------------------------------|
| name        | string        | null: false                     |
| text        | text          | null: false                     |
| price       | interger      | null: false                     |
| image       | references    | null: false, foreign_key: true  |
| category    | string        | null: false                     |
| status      | string        | null: false                     |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル
|colum        | Type        |Options                            |
|-------------|-------------|--------------------------------   |
| user        | reference   | null: false  foreign_key: true    |
| item        | reference   | null: false  foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery

## deliveriesテーブル
|colum        | Type        |Options                            |
|-------------|-------------|--------------------------------   |
| order       | reference   | null: false  foreign_key: true    |
| post_code   | string      | null: false                       |
| prefecture  | string      | null: false                       |
| city        | string      | null: false                       |
| address     | string      | null: false                       |
| building    | string      | null: false                       |
| tel_number  | string      | null: false                       |

### Association

- has_many :orders
