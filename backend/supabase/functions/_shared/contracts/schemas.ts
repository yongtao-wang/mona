// GENERATED from packages/cloud_contracts/schemas. Do not edit.
// Run `deno task gen` in packages/cloud_contracts.

// deno-fmt-ignore-file
export const schemas = {
  "common.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/common.schema.json",
    "title": "Common",
    "$defs": {
      "SchemaVersion": {
        "type": "integer",
        "minimum": 1,
        "maximum": 1
      },
      "LocalDate": {
        "type": "string",
        "pattern": "^\\d{4}-\\d{2}-\\d{2}$"
      },
      "LocalTime": {
        "type": "string",
        "pattern": "^([01]\\d|2[0-3]):[0-5]\\d$"
      },
      "TimeZone": {
        "type": "string",
        "minLength": 1,
        "maxLength": 64
      },
      "MomentAlias": {
        "type": "string",
        "pattern": "^m\\d{1,4}$"
      },
      "UtteranceAlias": {
        "type": "string",
        "pattern": "^u\\d{1,5}$"
      },
      "ItemAlias": {
        "type": "string",
        "pattern": "^i\\d{1,4}$"
      },
      "SpeakerToken": {
        "type": "string",
        "pattern": "^(ME|S\\d{1,3}|P\\d{1,3})$"
      },
      "ItemType": {
        "type": "string",
        "enum": [
          "promise",
          "decision",
          "fact",
          "question"
        ]
      },
      "Confidence": {
        "type": "number",
        "minimum": 0,
        "maximum": 1
      },
      "ModelVersion": {
        "type": "string",
        "minLength": 1,
        "maxLength": 128
      }
    }
  },
  "config_response.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/config_response.schema.json",
    "title": "ConfigResponse",
    "description": "GET /v1/config (spec §12.5). analysis_enabled is the kill switch.",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "min_app_version",
      "analysis_enabled",
      "recap_enabled",
      "prompt_versions",
      "max_body_kb"
    ],
    "properties": {
      "min_app_version": {
        "type": "string",
        "pattern": "^\\d+\\.\\d+\\.\\d+$"
      },
      "analysis_enabled": {
        "type": "boolean"
      },
      "recap_enabled": {
        "type": "boolean"
      },
      "prompt_versions": {
        "title": "PromptVersions",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "label",
          "recap"
        ],
        "properties": {
          "label": {
            "type": "string"
          },
          "recap": {
            "type": "string"
          }
        }
      },
      "max_body_kb": {
        "type": "integer",
        "minimum": 1
      }
    }
  },
  "device_request.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/device_request.schema.json",
    "title": "DeviceRequest",
    "description": "POST /v1/device (spec §12.4). Idempotent per (user, install_id).",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "schema_version",
      "install_id",
      "platform",
      "app_version",
      "os_version"
    ],
    "properties": {
      "schema_version": {
        "$ref": "common.schema.json#/$defs/SchemaVersion"
      },
      "install_id": {
        "type": "string",
        "format": "uuid"
      },
      "platform": {
        "title": "Platform",
        "type": "string",
        "enum": [
          "ios",
          "android",
          "web"
        ]
      },
      "app_version": {
        "type": "string",
        "pattern": "^\\d+\\.\\d+\\.\\d+$"
      },
      "os_version": {
        "type": "string",
        "minLength": 1,
        "maxLength": 32
      },
      "model": {
        "type": [
          "string",
          "null"
        ],
        "maxLength": 64
      }
    }
  },
  "device_response.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/device_response.schema.json",
    "title": "DeviceResponse",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "device_id"
    ],
    "properties": {
      "device_id": {
        "type": "string",
        "format": "uuid"
      }
    }
  },
  "error.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/error.schema.json",
    "title": "ErrorResponse",
    "description": "Every gateway error (spec §12.7). Never contains request content.",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "error"
    ],
    "properties": {
      "error": {
        "title": "ErrorBody",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "code",
          "retryable",
          "request_id"
        ],
        "properties": {
          "code": {
            "title": "ErrorCode",
            "type": "string",
            "enum": [
              "invalid_request",
              "unauthorized",
              "device_unknown",
              "not_found",
              "method_not_allowed",
              "body_too_large",
              "model_refused",
              "upgrade_required",
              "rate_limited",
              "quota_exceeded",
              "internal",
              "model_output_invalid",
              "analysis_disabled",
              "upstream_timeout"
            ]
          },
          "retryable": {
            "type": "boolean"
          },
          "request_id": {
            "type": "string"
          }
        }
      }
    }
  },
  "moment_label_request.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/moment_label_request.schema.json",
    "title": "MomentLabelRequest",
    "description": "POST /v1/moments/label (spec §12.1). Pseudonymized; ids are per-request aliases.",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "schema_version",
      "moment",
      "participants",
      "mentioned",
      "utterances",
      "options"
    ],
    "properties": {
      "schema_version": {
        "$ref": "common.schema.json#/$defs/SchemaVersion"
      },
      "moment": {
        "title": "LabelMoment",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "ref",
          "scene_hint",
          "local_date",
          "local_start",
          "tz",
          "duration_s",
          "languages"
        ],
        "properties": {
          "ref": {
            "$ref": "common.schema.json#/$defs/MomentAlias"
          },
          "scene_hint": {
            "anyOf": [
              {
                "title": "SceneHint",
                "type": "string",
                "enum": [
                  "meeting",
                  "commute",
                  "solo"
                ]
              },
              {
                "type": "null"
              }
            ]
          },
          "local_date": {
            "$ref": "common.schema.json#/$defs/LocalDate"
          },
          "local_start": {
            "$ref": "common.schema.json#/$defs/LocalTime"
          },
          "tz": {
            "$ref": "common.schema.json#/$defs/TimeZone"
          },
          "duration_s": {
            "type": "integer",
            "minimum": 0
          },
          "languages": {
            "type": "array",
            "maxItems": 4,
            "items": {
              "type": "string",
              "maxLength": 16
            }
          }
        }
      },
      "participants": {
        "type": "array",
        "maxItems": 64,
        "items": {
          "$ref": "common.schema.json#/$defs/SpeakerToken"
        }
      },
      "mentioned": {
        "type": "array",
        "maxItems": 64,
        "items": {
          "$ref": "common.schema.json#/$defs/SpeakerToken"
        }
      },
      "utterances": {
        "type": "array",
        "minItems": 1,
        "maxItems": 5000,
        "items": {
          "title": "LabelUtterance",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "id",
            "speaker",
            "t",
            "text",
            "uncertain"
          ],
          "properties": {
            "id": {
              "$ref": "common.schema.json#/$defs/UtteranceAlias"
            },
            "speaker": {
              "$ref": "common.schema.json#/$defs/SpeakerToken"
            },
            "t": {
              "type": "integer",
              "minimum": 0,
              "description": "Seconds from the moment's start"
            },
            "text": {
              "type": "string",
              "minLength": 1,
              "maxLength": 2000
            },
            "uncertain": {
              "type": "boolean"
            }
          }
        }
      },
      "options": {
        "title": "LabelOptions",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "purpose",
          "want_title"
        ],
        "properties": {
          "purpose": {
            "title": "LabelPurpose",
            "type": "string",
            "enum": [
              "label",
              "minutes"
            ]
          },
          "want_title": {
            "type": "boolean"
          }
        }
      }
    }
  },
  "moment_label_response.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/moment_label_response.schema.json",
    "title": "MomentLabelResponse",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "scene",
      "tone",
      "title",
      "summary",
      "items",
      "minutes",
      "model_version"
    ],
    "properties": {
      "scene": {
        "title": "SceneLabel",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "label",
          "confidence"
        ],
        "properties": {
          "label": {
            "type": "string",
            "maxLength": 32
          },
          "confidence": {
            "$ref": "common.schema.json#/$defs/Confidence"
          }
        }
      },
      "tone": {
        "title": "Tone",
        "type": "string",
        "enum": [
          "neutral",
          "positive",
          "negative",
          "conflict"
        ]
      },
      "title": {
        "type": [
          "string",
          "null"
        ],
        "maxLength": 200
      },
      "summary": {
        "type": "string",
        "maxLength": 4000
      },
      "items": {
        "type": "array",
        "maxItems": 100,
        "items": {
          "title": "LabelItem",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "id",
            "type",
            "text",
            "owner",
            "counterpart",
            "due",
            "sources",
            "confidence"
          ],
          "properties": {
            "id": {
              "$ref": "common.schema.json#/$defs/ItemAlias"
            },
            "type": {
              "$ref": "common.schema.json#/$defs/ItemType"
            },
            "text": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1000
            },
            "owner": {
              "anyOf": [
                {
                  "$ref": "common.schema.json#/$defs/SpeakerToken"
                },
                {
                  "type": "null"
                }
              ]
            },
            "counterpart": {
              "anyOf": [
                {
                  "$ref": "common.schema.json#/$defs/SpeakerToken"
                },
                {
                  "type": "null"
                }
              ]
            },
            "due": {
              "anyOf": [
                {
                  "title": "Due",
                  "type": "object",
                  "additionalProperties": false,
                  "required": [
                    "phrase",
                    "date"
                  ],
                  "properties": {
                    "phrase": {
                      "type": "string",
                      "maxLength": 200
                    },
                    "date": {
                      "anyOf": [
                        {
                          "$ref": "common.schema.json#/$defs/LocalDate"
                        },
                        {
                          "type": "null"
                        }
                      ]
                    }
                  }
                },
                {
                  "type": "null"
                }
              ]
            },
            "sources": {
              "type": "array",
              "minItems": 1,
              "items": {
                "$ref": "common.schema.json#/$defs/UtteranceAlias"
              }
            },
            "confidence": {
              "$ref": "common.schema.json#/$defs/Confidence"
            }
          }
        }
      },
      "minutes": {
        "anyOf": [
          {
            "title": "Minutes",
            "type": "object",
            "additionalProperties": false,
            "required": [
              "decisions",
              "promises",
              "open_questions",
              "follow_up_draft"
            ],
            "properties": {
              "decisions": {
                "type": "array",
                "items": {
                  "$ref": "common.schema.json#/$defs/ItemAlias"
                }
              },
              "promises": {
                "type": "array",
                "items": {
                  "$ref": "common.schema.json#/$defs/ItemAlias"
                }
              },
              "open_questions": {
                "type": "array",
                "items": {
                  "$ref": "common.schema.json#/$defs/ItemAlias"
                }
              },
              "follow_up_draft": {
                "type": [
                  "string",
                  "null"
                ],
                "maxLength": 8000
              }
            }
          },
          {
            "type": "null"
          }
        ]
      },
      "model_version": {
        "$ref": "common.schema.json#/$defs/ModelVersion"
      }
    }
  },
  "recap_request.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/recap_request.schema.json",
    "title": "RecapRequest",
    "description": "POST /v1/recap (spec §12.2). Tokens are day-scoped for this request.",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "schema_version",
      "day",
      "tz",
      "moments",
      "items",
      "marks",
      "stats",
      "preferences",
      "max_entries"
    ],
    "properties": {
      "schema_version": {
        "$ref": "common.schema.json#/$defs/SchemaVersion"
      },
      "day": {
        "$ref": "common.schema.json#/$defs/LocalDate"
      },
      "tz": {
        "$ref": "common.schema.json#/$defs/TimeZone"
      },
      "moments": {
        "type": "array",
        "maxItems": 200,
        "items": {
          "title": "RecapMoment",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "ref",
            "scene",
            "local_start",
            "duration_s",
            "title",
            "summary"
          ],
          "properties": {
            "ref": {
              "$ref": "common.schema.json#/$defs/MomentAlias"
            },
            "scene": {
              "type": [
                "string",
                "null"
              ],
              "maxLength": 32
            },
            "local_start": {
              "$ref": "common.schema.json#/$defs/LocalTime"
            },
            "duration_s": {
              "type": "integer",
              "minimum": 0
            },
            "title": {
              "type": [
                "string",
                "null"
              ],
              "maxLength": 200
            },
            "summary": {
              "type": [
                "string",
                "null"
              ],
              "maxLength": 4000
            }
          }
        }
      },
      "items": {
        "type": "array",
        "maxItems": 500,
        "items": {
          "title": "RecapItem",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "ref",
            "moment",
            "type",
            "direction",
            "text",
            "due_date",
            "confidence"
          ],
          "properties": {
            "ref": {
              "$ref": "common.schema.json#/$defs/ItemAlias"
            },
            "moment": {
              "$ref": "common.schema.json#/$defs/MomentAlias"
            },
            "type": {
              "$ref": "common.schema.json#/$defs/ItemType"
            },
            "direction": {
              "title": "Direction",
              "type": "string",
              "enum": [
                "by_user",
                "to_user",
                "other"
              ]
            },
            "text": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1000
            },
            "due_date": {
              "anyOf": [
                {
                  "$ref": "common.schema.json#/$defs/LocalDate"
                },
                {
                  "type": "null"
                }
              ]
            },
            "confidence": {
              "$ref": "common.schema.json#/$defs/Confidence"
            }
          }
        }
      },
      "marks": {
        "type": "array",
        "maxItems": 200,
        "items": {
          "title": "RecapMark",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "moment",
            "local_time"
          ],
          "properties": {
            "moment": {
              "$ref": "common.schema.json#/$defs/MomentAlias"
            },
            "local_time": {
              "$ref": "common.schema.json#/$defs/LocalTime"
            }
          }
        }
      },
      "stats": {
        "title": "RecapStats",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "moments",
          "longest_moment_s",
          "meeting_s"
        ],
        "properties": {
          "moments": {
            "type": "integer",
            "minimum": 0
          },
          "longest_moment_s": {
            "type": "integer",
            "minimum": 0
          },
          "meeting_s": {
            "type": "integer",
            "minimum": 0
          }
        }
      },
      "preferences": {
        "title": "RecapPreferences",
        "type": "object",
        "additionalProperties": false,
        "required": [
          "not_important",
          "right",
          "counterpart_right"
        ],
        "properties": {
          "not_important": {
            "type": "object",
            "maxProperties": 64,
            "additionalProperties": {
              "type": "integer",
              "minimum": 0
            }
          },
          "right": {
            "type": "object",
            "maxProperties": 64,
            "additionalProperties": {
              "type": "integer",
              "minimum": 0
            }
          },
          "counterpart_right": {
            "type": "object",
            "maxProperties": 64,
            "additionalProperties": {
              "type": "integer",
              "minimum": 0
            }
          }
        }
      },
      "max_entries": {
        "type": "integer",
        "minimum": 1,
        "maximum": 10
      }
    }
  },
  "recap_response.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/recap_response.schema.json",
    "title": "RecapResponse",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "quiet_day",
      "ranked",
      "highlight",
      "fun_line",
      "model_version"
    ],
    "properties": {
      "quiet_day": {
        "type": "boolean"
      },
      "ranked": {
        "type": "array",
        "maxItems": 50,
        "items": {
          "$ref": "common.schema.json#/$defs/ItemAlias"
        }
      },
      "highlight": {
        "anyOf": [
          {
            "$ref": "common.schema.json#/$defs/MomentAlias"
          },
          {
            "type": "null"
          }
        ]
      },
      "fun_line": {
        "type": [
          "string",
          "null"
        ],
        "maxLength": 300
      },
      "model_version": {
        "$ref": "common.schema.json#/$defs/ModelVersion"
      }
    }
  },
  "telemetry_request.schema.json": {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://mona.app/contracts/telemetry_request.schema.json",
    "title": "TelemetryRequest",
    "description": "POST /v1/telemetry (spec §12.3, §15). Content-free; property keys are whitelisted per event name by the gateway.",
    "type": "object",
    "additionalProperties": false,
    "required": [
      "schema_version",
      "events"
    ],
    "properties": {
      "schema_version": {
        "$ref": "common.schema.json#/$defs/SchemaVersion"
      },
      "events": {
        "type": "array",
        "minItems": 1,
        "maxItems": 100,
        "items": {
          "title": "TelemetryEvent",
          "type": "object",
          "additionalProperties": false,
          "required": [
            "name",
            "props",
            "occurred_at"
          ],
          "properties": {
            "name": {
              "type": "string",
              "pattern": "^[a-z][a-z0-9_]{0,63}$"
            },
            "props": {
              "type": "object",
              "maxProperties": 16,
              "additionalProperties": {
                "type": [
                  "string",
                  "number",
                  "boolean"
                ],
                "maxLength": 64
              }
            },
            "occurred_at": {
              "type": "integer",
              "description": "UTC epoch milliseconds"
            }
          }
        }
      }
    }
  }
} as const;
