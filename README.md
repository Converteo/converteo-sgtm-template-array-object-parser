# converteo-sgtm-template-array-object-parser
Custom template for Server GTM helping to parse Objects and Arrays with dot notation.

## 1. Array / Object input
Fill with a variable returning an array or an object.

Example :
```json
{
  "ecommerce":{
    "currency": "EUR",
    "items":[{
      "item_id": "SKU-123",
      "item_name": "Tee Shirt",
      "price": 12.90
    },
    {
      "item_id": "SKU-456",
      "item_name": "Red Cap",
      "price": 15
    }]
  }
}
```

## 2. Dot Keys
Enter the keys using the dot notation to get targeted data.

Example :

ecommerce.items.1.item_name 
Returns : "Red Cap"


ecommerce.item.0 
Returns :
```json
{
  "item_id": "SKU-456",
  "item_name": "Red Cap",
  "price": 15
}
```
