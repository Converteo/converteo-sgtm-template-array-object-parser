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
  "displayName": "Advanced Firestore Query - v1 - by Converteo",
  "categories": ["TAG_MANAGEMENT", "UTILITY", "ANALYTICS"],
  "description": "Query a firestore collection and find a document (or list of documents), find a value (or list of values) from one document or multiple documents.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "SELECT",
    "displayName": "SELECT",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "select_mode",
        "displayName": "Mode",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "select_all",
            "displayValue": "SELECT *"
          },
          {
            "value": "select_keys",
            "displayValue": "SELECT {{keys}}"
          },
          {
            "value": "count",
            "displayValue": "COUNT"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "select_all",
        "help": "If you select a COUNT option, do not forget to increase the LIMIT (Firestore limits requests to 5 results by default)"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "select_keys",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Key Path",
            "name": "key",
            "type": "TEXT"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "select_mode",
            "paramValue": "select_keys",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "FROM",
    "displayName": "FROM",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "from_mode",
        "displayName": "Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "collection",
            "displayValue": "Collection"
          },
          {
            "value": "document",
            "displayValue": "Document"
          }
        ],
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "collection_path",
        "displayName": "Collection Path",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "from_mode",
            "paramValue": "collection",
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "document_path",
        "displayName": "Document Path",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "from_mode",
            "paramValue": "document",
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "WHERE",
    "displayName": "WHERE",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "where_docprop",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field",
            "name": "key",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Operator",
            "name": "operator",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "\u003d\u003d",
                "displayValue": "EQUALS"
              },
              {
                "value": "!\u003d",
                "displayValue": "IS NOT EQUAL"
              },
              {
                "value": "\u003c",
                "displayValue": "LESS THAN"
              },
              {
                "value": "\u003c\u003d",
                "displayValue": "LESS THAN OR EQUALS"
              },
              {
                "value": "\u003e",
                "displayValue": "MORE THAN"
              },
              {
                "value": "\u003e\u003d",
                "displayValue": "MORE THAN OR EQUALS"
              },
              {
                "value": "in",
                "displayValue": "IN"
              },
              {
                "value": "not-in",
                "displayValue": "NOT IN"
              },
              {
                "value": "array-contains",
                "displayValue": "ARRAY CONTAINS"
              },
              {
                "value": "array-contains-any",
                "displayValue": "ARRAY CONTAINS ANY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "enablingConditions": []
      }
    ],
    "enablingConditions": [
      {
        "paramName": "from_mode",
        "paramValue": "collection",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "LIMIT \u0026 ORDER",
    "displayName": "ORDER \u0026 LIMIT",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "limit",
        "checkboxText": "Limit to",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "limit_number",
            "displayName": "Number of Results",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "limit",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "defaultValue": 5
          }
        ],
        "help": "Default limit (5 results) is automatically applied. Select this option to customize limit. Limit is applied before order."
      },
      {
        "type": "CHECKBOX",
        "name": "order",
        "checkboxText": "Order by",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "order_key",
            "displayName": "Field",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "order",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "help": "Must be a key available in SELECT"
          },
          {
            "type": "SELECT",
            "name": "order_mode",
            "displayName": "Mode",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "ASC",
                "displayValue": "ASC"
              },
              {
                "value": "DESC",
                "displayValue": "DESC"
              }
            ],
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "order",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ],
        "help": "Order results on  a specific selected key. The key you specify must be selected in \"SELECT\" section before. Order does not work when counting. Order is applied after limit."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "from_mode",
        "paramValue": "collection",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "more_settings",
    "displayName": "More Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "override_pid",
        "checkboxText": "Override Project ID",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "pid",
            "displayName": "Project ID",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "override_pid",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ],
        "help": "By default, this variable will use the project ID specified in the GOOGLE_CLOUD_PROJECT environment variable on your server. If the GOOGLE_CLOUD_PROJECT environment variable on your server is not set, you must specify the project ID here. App Engine deployments have GOOGLE_CLOUD_PROJECT set by default."
      },
      {
        "type": "CHECKBOX",
        "name": "disable_cache",
        "checkboxText": "Disable cache",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "By default, Firestore caches its response for the duration of the container execution."
      },
      {
        "type": "SELECT",
        "name": "output_format_collection",
        "displayName": "Output Format",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "document_data",
            "displayValue": "Array of document data (default)"
          },
          {
            "value": "document",
            "displayValue": "Array of raw documents (documents includes \"document.id\" and data)"
          },
          {
            "value": "docid",
            "displayValue": "Array of document.id (ignore selected keys or counting)"
          },
          {
            "value": "first_document_data",
            "displayValue": "First document data (return only the first data object)"
          },
          {
            "value": "first_document",
            "displayValue": "First raw document (return only the first complete document - with document.id)"
          },
          {
            "value": "first_docid",
            "displayValue": "First document.id (return only the document.id from the first document)"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "document_data",
        "help": "\"Raw document\" is a result from Firestore including document.id and data object. When you select \"document data\", the output returns only the data object from the document.",
        "enablingConditions": [
          {
            "paramName": "from_mode",
            "paramValue": "collection",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "output_format_document",
        "displayName": "Output Format",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "document_data",
            "displayValue": "Document data (Default)"
          },
          {
            "value": "document",
            "displayValue": "Raw document (return the complete document - with document.id)"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "document_data",
        "help": "\"Raw document\" is a result from Firestore including document.id and data object. When you select \"document data\", the output returns only the data object from the document.",
        "enablingConditions": [
          {
            "paramName": "from_mode",
            "paramValue": "document",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const log = require('logToConsole');
const Firestore = require('Firestore');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const createRegex = require('createRegex');
const testRegex = require('testRegex');
const type = require('getType');

//log(data);

// project id
let pid;
if (data.override_pid && '' != data.pid) pid = data.pid;


// limit
let limit;
if ('collection' == data.from_mode && data.limit && '' != data.limit_number) limit = data.limit_number;

// firestore options
const firestoreOptions = {};
if ('undefined' != pid) firestoreOptions.projectId = pid;
if ('undefined' != limit) firestoreOptions.limit = limit;
if (data.disableCache) firestoreOptions.disableCache = true;

// query
const queries = [];
if ('undefined' != type(data.where_docprop)) {
  for (var i=0; i<data.where_docprop.length; i++) {
    let key = data.where_docprop[i].key;
    let operator = data.where_docprop[i].operator;
    let value = data.where_docprop[i].value;
    if (isStringNumber(value)) value = makeNumber(value);
    if (''!=key && ''!=operator && ''!=value) queries.push([key, operator, value]);
  }
}


// results
let results;

// from collection
if ('collection' == data.from_mode) {
  return Firestore.query(data.collection_path, queries, firestoreOptions).then(
    (documents) => {
      
      let results;
      switch (data.select_mode) {
          
        case 'select_keys':
          let selected = data.select_keys.filter((obj) => obj.key != '').map((obj) => obj.key);
          results = documents.map(doc => selected.reduce((obj, key) => {
            obj = {id: doc.id, data:obj.data||{}};
            obj.data[key] = doc.data[key];
            return obj;
          }, {}));
          break;
          
        case 'count':
          results = documents.length;
          break;
          
        /*
        case 'count_distinct':
          // to do
          break;
        */
          
        case 'select_all':
        default:
          results = documents;
          break;
      }
      
      // order (array.sort)
      if ('collection' == data.from_mode && 1 < results.length) {
        results = results.sort((a,b) => {
          let fa = (a.data[data.order_key] || '').toLowerCase(),
              fb = (b.data[data.order_key] || '').toLowerCase();
          if (fa < fb) return 'ASC' == data.order_mode ? -1 : 1;
          if (fa > fb) return 'ASC' == data.order_mode ? 1 : -1;
          return 0;
        });
      }
      
      results = outputFormat(results, data.output_format_collection);
      return results;
    },
    ()=> undefined
  );
}

// from document
if ('document' == data.from_mode) {
  return Firestore.read(data.document_path, firestoreOptions).then(
    (document) => {
      
      let result;
      switch (data.select_mode) {
          
        case 'select_keys':
          let selected = data.select_keys.filter((obj) => obj.key != '').map((obj) => obj.key);
          result = {
            "id": document.id,
            "data":{}
          };
          selected.forEach((key) => {
            result.data[key] = document.data[key] || undefined;
          });
          break;
          
        case 'count':
        //case 'count_distinct':
          result = null != document ? 1: 0;
          break;
          
        case 'select_all':
        default:
          result = document;
          break;
      }
      result = outputFormat([result], data.output_format_document);
      return result[0];
    },
    () => undefined);
}

return undefined;


/* helpers */
function outputFormat(docs, option) {
  docs = docs || [];
  let output;
  switch (option) {
      
    case 'document_data':
      output = docs.map((d) => d.data);
      break;
      
    case 'documents':
      output = docs;
      break;
      
    case 'docid':
      output = docs.map((d) => d.id);
      break;
      
    case 'first_document_data':
      output = docs[0].data;
      break;
      
    case 'first_document':
      output = docs[0];
      break;
      
    case 'first_docid':
      output = docs[0].id;
      break;
      
    default:
      output = docs;
      break;
  }
  return output;
}


/* Helpers */
function isStringNumber(str) {
  str = makeString(str);
  const rgx = createRegex('^(-)?[0-9]+(\\.[0-9]+)?$');
  return testRegex(rgx, str);
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_firestore",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedOptions",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "projectId"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "operation"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 31/07/2023 14:15:57


