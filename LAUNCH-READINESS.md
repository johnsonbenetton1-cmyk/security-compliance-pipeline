# Launch readiness — Johnson Finance Services

This repository currently contains a static HTML website hosted from GitHub Pages (publication must be confirmed in repository settings). It is not yet a full customer portal or an automated payment application.

## What is present

- Public home, services, client inquiry, privacy, terms, resources, and Bitcoin information pages.
- Introductory administrative service prices are listed on `services.html`: $49, $59, $79, and $50/hour for the stated services.
- The inquiry process asks customers to agree to a written scope and price before work begins.
- Bitcoin payments are manual: the business must independently verify receipt and send written confirmation.
- `global-research.html` is a curated directory of public institutional data sources. It does not unlock private or restricted information.

## Customer revenue path today

1. A prospective customer reviews the public services and sends an inquiry.
2. The business confirms that the requested work fits its administrative scope.
3. The business sends a written scope, deliverables, timing, and total fee.
4. The customer accepts the scope in writing.
5. Payment is handled only through a method the business has independently configured and verified. The current Bitcoin page describes a manual process; there is no card checkout, recurring billing, invoice automation, payment webhook, or automatic receipt system in this repository.
6. The business verifies payment, performs the agreed administrative work, and sends the deliverable and confirmation.

Do not claim a payment has been received based only on a customer email or transaction ID. Do not promise income, funding, approvals, or business results.

## Required before advertising automated checkout

- Choose and open a supported payment-processor account in the actual business owner's name and complete its identity, business, bank, and compliance checks.
- Create payment links for each service only after confirming the final service scope, pricing, refund/cancellation terms, and applicable tax treatment.
- If payment must be tied to authenticated customer accounts or order records, build a server-side integration and verify processor webhooks. Never put secret API keys in browser JavaScript, HTML, Git history, or a public repository.
- Publish accurate refund, cancellation, privacy, record-retention, and service terms. Have a qualified professional review legal and regulatory obligations before launch.
- Test a real low-value transaction, refund, confirmation email, and reconciliation before announcing checkout as live.

## Authentication and customer portal

There is currently no application login, password storage, session management, protected route, customer dashboard, or Supabase integration in this static site. A real portal requires a Supabase project and configuration. The public Supabase URL and publishable/anon key may be used in the browser as designed by Supabase; the service-role key must remain server-side and must never be committed. Enable Row Level Security on every table containing customer data, define least-privilege policies, and test that one customer cannot read another customer's records.

Required setup values must be obtained from the owner's Supabase project. Do not invent project IDs, keys, or credentials and do not ask the owner to paste secret service-role keys into chat.

## Global information access

The research directory links to public global sources. A later research product can search public datasets and summarize verified findings with source links. It cannot lawfully or technically provide unrestricted access to every system, private account, paywalled resource, or confidential record. Respect terms of service, copyright, privacy, API quotas, and access controls.

## Deployment checklist

- [ ] Confirm GitHub Pages is enabled and the published URL works over HTTPS.
- [ ] Add and verify a custom business domain if desired.
- [ ] Confirm business contact details, ownership, and all public claims.
- [ ] Confirm service pricing, scope, capacity, and written agreement with a qualified reviewer.
- [ ] Configure a real payment processor; test payment, refund, webhook, and receipt handling.
- [ ] Add Supabase only after the owner provides/chooses the project; implement Auth, protected routes, and Row Level Security.
- [ ] Test every page and form on mobile and desktop.
- [ ] Add privacy-conscious analytics and a process for handling inquiries and customer data.
- [ ] Run security and accessibility checks before promoting the site.

## Current launch status

**Public information site:** content exists; publication and live behavior still require verification.

**Paid service inquiries:** the website advertises administrative services and introductory prices. This is not a guarantee of customer demand or earnings.

**Automated card payments:** not implemented.

**Customer authentication / protected portal:** not implemented.

**Global research:** a curated public-source directory is included; universal or private access is not available.


## Supabase customer portal update — 14 November 2026

- Supabase project created: `johnson-finance-customer-platform` in US West; quoted project cost at creation was $0/month.
- Email/password Auth client flow added in `customer-portal.html` (sign-up, sign-in, password reset, sign-out).
- Database tables added: `customer_profiles` and `service_requests`; RLS enabled with owner-only profile/request access. Security advisor returned no security lints after migration.
- This is a static GitHub Pages front end. It uses a client-side signed-in interface plus database-enforced RLS; it is not server-side route protection.
- Still required before public customer onboarding: set Supabase Auth Site URL and redirect allow-list to the final GitHub Pages URL; test confirmation and reset email delivery; test two-account data isolation; publish and verify the new site build.
- No payment processor, checkout, paid subscription, or automatic payment reconciliation is configured. Do not advertise payment acceptance or guaranteed earnings.
