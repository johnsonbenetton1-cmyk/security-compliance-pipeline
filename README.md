# Johnson Finance Services — public website and administrative support

This repository contains the public static website for Johnson Finance Services.

## Website pages

- `index.html` — business overview and contact details
- `services.html` — administrative service descriptions and introductory pricing
- `client-intake.html` — prospective client inquiry
- `global-research.html` — curated links to public global data and research institutions
- `resources.html` — client resources
- `privacy.html` and `terms.html` — public policy pages
- `bitcoin-payment.html` — manual Bitcoin payment instructions

## Local preview

Open `index.html` in a browser, or run a local static server from the repository root:

```bash
python -m http.server 8000
```

Then visit `http://localhost:8000`.

## Deployment

The site is plain HTML/CSS/JavaScript and has no build step. To publish it with GitHub Pages, configure the repository's Pages settings to deploy from the intended branch and root folder, then verify the resulting HTTPS URL. A successful GitHub commit does not by itself prove that Pages is enabled or that a domain is configured.

## Important implementation status

This is not currently an authenticated web application. It has no customer login, protected routes, database, payment processor checkout, recurring billing, or automatic payment confirmation. Bitcoin payment instructions describe a manual verification process.

See [LAUNCH-READINESS.md](LAUNCH-READINESS.md) for the revenue workflow, deployment checklist, and the work still required before automated payments or a customer portal can be advertised.

## Security

- Never commit passwords, private keys, recovery phrases, processor secrets, Supabase service-role keys, or customer sensitive data.
- Keep server secrets in a trusted server-side secret store.
- Use Supabase Row Level Security if customer records are added.
- Only provide services within the business's verified qualifications and legal authority.
- The global research directory links to public sources; it does not bypass privacy, access controls, subscriptions, or copyright restrictions.
