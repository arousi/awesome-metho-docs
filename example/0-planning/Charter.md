# Project Charter

## About the project

The Identity & Billing example: add passwordless sign-in and monthly invoicing to
a small SaaS product. This charter is illustrative - replace it with your own.

## Purpose

Give users a password-free way to sign in and give the business a reliable
monthly invoice run, documented end to end across phases 0-6.

## Objectives (measurable)

- Passwordless sign-in available to 100% of active accounts.
- Magic-link verification under 500 ms at p95 (see `../2-requirements/NFRs.md`, NFR-2).
- Monthly invoices generated for every billable account within the nightly window.

## Scope

### In scope

1. Passwordless email sign-in (magic link).
2. Device binding on sign-in.
3. Monthly invoice generation and customer invoice view.

### Out of scope

- Payment collection and dunning.
- Data migration from the legacy auth system.

## Constraints

- Email delivery depends on an external provider.
- Small team; one release train.

## Assumptions

- Accounts already have a verified email on file.

## Success criteria

1. Stakeholders sign off on the requirements baseline.
2. Every Must FR has at least one screen (Phase 3) and one test case (Phase 6).
