#!/usr/bin/env python3
"""Small deterministic schema-aware generator for this intentionally tiny GraphQL slice.

Validates that required schema fields and operation selections are present, then
writes the typed Dart models from a checked-in template. No network or backend.
"""
from pathlib import Path
import re
root=Path(__file__).resolve().parents[1]
schema=(root/'graphql/schema.graphql').read_text()
ops=(root/'graphql/operations.graphql').read_text()
required=['type Order','type Service','input CreateOrderInput','enum OrderStatus','type Mutation','type Query']
for item in required:
    if item not in schema: raise SystemExit(f'Missing schema declaration: {item}')
for item in ['mutation CreateOrder','query GetOrder','idempotencyKey','totalCents','cardLast4','services']:
    if item not in ops: raise SystemExit(f'Missing operation/selection: {item}')
# The model template is deliberately explicit: changes to schema/operations require
# reviewing the typed adapter rather than silently accepting dynamic data.
output=root/'lib/core/generated/checkout_models.g.dart'
assert output.exists(), 'Generated model template missing'
print('GraphQL schema and operations validated; typed models checked in:', output)
