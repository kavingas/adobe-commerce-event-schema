#!/bin/bash
NAME=$1
VERSION=$2
mkdir -p schemas/com.adobe.magento.entity/$NAME/jsonschema
touch schemas/com.adobe.magento.entity/$NAME/jsonschema/$VERSION
code schemas/com.adobe.magento.entity/$NAME/jsonschema/$VERSION