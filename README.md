
# Iglu Schemas for Adobe Commerce Events

This repository contains [Iglu-compatible](https://docs.snowplow.io/docs/pipeline-components/iglu/) JSON schemas used to validate custom events sent through our Snowplow pipeline.

## 📁 Directory Structure

Schemas are organized using the following folder structure:

```
.
└── com.company
    └── custom_event
        └── jsonschema
            └── 1-0-0.json
```

Each schema follows the pattern:
```
<vendor>/<event_name>/jsonschema/<version>.json
```

## 📦 Schema Example

```json
{
  "$schema": "http://iglucentral.com/schemas/com.snowplowanalytics.self-desc/schema/jsonschema/1-0-0#",
  "self": {
    "vendor": "com.company",
    "name": "custom_event",
    "format": "jsonschema",
    "version": "1-0-0"
  },
  "type": "object",
  "properties": {
    "userId": { "type": "string" },
    "action": { "type": "string" },
    "timestamp": { "type": "string", "format": "date-time" },
    "meta": {
      "type": "object",
      "properties": {
        "page": { "type": "string" },
        "device": { "type": "string" }
      },
      "required": ["page", "device"]
    }
  },
  "required": ["userId", "action", "timestamp", "meta"],
  "additionalProperties": false
}
```

## 🛠 How to Use

1. **Host the repository** as a static site (e.g., GitHub Pages, AWS S3).
2. **Add the repository URL** to your Snowplow resolver config:
   ```json
   {
     "name": "My Custom Schemas",
     "priority": 0,
     "vendorPrefixes": [ "com.company" ],
     "connection": {
       "http": {
         "uri": "https://yourdomain.com/schemas"
       }
     }
   }
   ```
3. **Deploy or update your pipeline** to use the updated resolver.
4. **Send custom events** with `schema` fields pointing to the new schema:
   ```
   iglu:com.company/custom_event/jsonschema/1-0-0
   ```

## ✅ Best Practices

- Follow [semantic versioning](https://semver.org/) for schema changes:
  - `PATCH`: documentation-only or optional field changes.
  - `MINOR`: backward-compatible field additions.
  - `MAJOR`: breaking changes (e.g., required field changes).
- Set `"additionalProperties": false` to avoid unexpected data.
- Validate new schemas using tools like:
  - [`snowplow-schema-validator`](https://github.com/snowplow-incubator/snowplow-schema-validator)
  - [Snowplow Mini](https://docs.snowplow.io/docs/collecting-data/collecting-from-own-applications/snowplow-mini/)

## 🧪 Testing

To validate an event against a schema:

```bash
snowplow-schema-validator --schema-path schemas/com.company/custom_event/jsonschema/1-0-0.json --json-path event.json
```

Or test live using Snowplow Mini’s event validation page.

## 📬 Contact

For questions or support, contact the data engineering team or raise an issue in this repository.

```
