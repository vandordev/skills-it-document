# API Docs Reference

Use this reference when documenting API behavior for humans or agents.

## Purpose

API docs should make it easy to understand how to call the API, what it returns, and how errors behave.

## Recommended Structure

1. Overview
2. Authentication
3. Base URL and Environments
4. Endpoints
5. Request Examples
6. Response Examples
7. Error Handling
8. Pagination / Filtering / Sorting
9. Rate Limits / Limits
10. Change Notes

## Writing Rules

- Prefer source-of-truth schema if available.
- Document request and response shapes clearly.
- Include example payloads that are realistic and valid.
- Mention required headers, auth, and environment assumptions.
- If the API is external, research the official docs first.

## Quality Check

- A reader should know how to make the request correctly on the first try.
- Edge cases and error states should not be hidden.
