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
|birthday|integer|null: false|
|telnumber|integer|null: false|
### Association
- belong_to :Addlesses
- belong_to :Cards
- has_many :Profucts
## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|address_number|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address1|string||
|address2|string||
### Association
- belongs_to :Users
## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customoer_id|integer||
|card_id|integer||
|token|string||
### Association
- belongs_to :Users
## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|photo|string||
### Association
- belongs_to :Products 

## prodactsテーブル

|Column|Type|Options|
|------|----|-------|
|userid|string|null: false|
|name|string|null: false|
|Details|string|null: false|
|Categories|string|null: false|
|price|integer|null: false|
|status|string｜null: false|
|exhibition|string|null: false|
|date and time｜integer｜null: false|

### Association
- has_many :images
- has_many :main_categories


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|prodacts_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :prodacts

## main_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|prodacts_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :prodacts
- has_many :sub_categories


# sub_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|main_categories_id|integer|null: false, foreign_key: true|
|name|integer|null: false|

### Association
- belongs_to :main_categopries
- has_many :sub2_categories



# sub2_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|sub_categories_id|integer|null: false, foreign_key: true|
|name|integer|null: false|

### Association
- belongs_to :sub_categopries

