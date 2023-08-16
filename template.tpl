___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Array \u0026 Object Parser - by Converteo",
  "categories": ["TAG_MANAGEMENT", "UTILITY", "ANALYTICS"],
  "description": "Parse data from objects and arrays using dot notation.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "input",
    "displayName": "Array / Object",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "dotkeys",
    "displayName": "Dot Keys",
    "simpleValueType": true,
    "help": "Use dot notation (ex: ecommerce.items.0.item_name)"
  }
]


___SANDBOXED_JS_FOR_SERVER___

//const log = require('logToConsole');
const JSON = require('JSON');
const type = require('getType');
const createRegex = require('createRegex');
const testRegex = require('testRegex');
const makeString = require('makeString');

let isArrayRgx = createRegex('^\\[.*\\]$');
let isObjectRgx = createRegex('^\\{.*\\}$');
let input = data.input;
if ( 'string' == type(input) && testRegex(isArrayRgx, input) ) input = JSON.parse(input);
if ( 'string' == type(input) && testRegex(isObjectRgx, input) ) input = JSON.parse(input);
if ( !testRegex( createRegex('(array|object)'), type(input) ) ) return undefined;

let keys = data.dotkeys || '';
keys = keys.split('.');
return parse(input, keys);



/* helpers */
function parse(data, keys, index) {
  if (!keys.length || ''==keys[0]) return data;
  index = index || 0;
  let key = keys[index];
  if (index < keys.length) {
    let parsed = data[ key ];
    if ('undefined' == type(parsed)) return undefined;
    return parse(parsed, keys, (index+1));
  }
  return data;
}


___TESTS___

scenarios: []


___NOTES___

Created on 14/06/2023 12:08:11


