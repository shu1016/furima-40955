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
| birthday            | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル
|colum            | Type          |Options                          |
|-----------------|---------------|---------------------------------|
| user            | references    | null: false   foreign_key: true |
| name            | string        | null: false                     |
| content         | text          | null: false                     |
| price           | integer       | null: false                     |
| category_id     | integer       | null: false                     |
| status_id       | integer       | null: false                     |
| cost_id         | integer       | null: false                     |
| region_id       | integer       | null: false                     |
| period_id       | integer       | null: false                     |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :cost
- belongs_to_active_hash :region
- belongs_to_active_hash :period


## ordersテーブル
|colum        | Type        |Options                            |
|-------------|-------------|--------------------------------   |
| user        | references  | null: false  foreign_key: true    |
| item        | references  | null: false  foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル
|colum          | Type        |ptions                            |
|-------------  |-------------|-------------------------------   |
| order         | references  | null: false  foreign_key: rue    |
| post_code     | string      | null: false                      |
| region_id     | integer     | null: false                      |
| city          | string      | null: false                      |
| address       | string      | null: false                      |
| building      | string      |                                  |
| tel_number    | string      | null: false                      |

### Association

- belongs_to :order