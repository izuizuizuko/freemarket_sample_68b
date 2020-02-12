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
|address_id|integer|foreign_key: true|
|cards_id|integer|foreign_key: true|
### Association
- belong_to :address
- belong_to :cards
- has_many :profucts
## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|address_number|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address1|string||
|address2|string||
### Association
- belongs_to :users

## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customername|string||
|card_num|string||
|token|string||
### Association
- belongs_to :users

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|photo|string||
### Association
- belongs_to :products 


## prodactsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|name|string|null: false|
|detail|string|null: false|
|categorie_id|integer|null: false|
|price|integer|null: false|
|status|string｜null: false|
|exhibition|string|null: false|
|date_and_time｜integer｜null: false|

### Association
- has_many :images
- belongs_to :categories
- belongs_to :users


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