## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|tstring|null: false|
|kana_family_name|string|null: false|
|kana_first_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|telnumber|integer|null: false|

### Association
- has_one :address
- has_one :card
- has_many :products
## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|address_number|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|town|string||
|house_number|string||
### Association
- belongs_to :user

## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customername|string||
|card_num|string||
|token|string||
### Association
- belongs_to :user


## prodactsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|name|string|null: false|
|detail|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|condition|string｜null: false|
|status|string|null: false|


### Association
- has_many :images
- belongs_to :category
- belongs_to :user


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|prodact_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :prodact

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|path|ancestry, :string||
|name|string|null: false|

### Association
- has_ancestry
- has_many :prodacts
