# Employer Profile Automation

Professional Make.com automation for generating employer profiles using Brandfetch API.

## Quick Start

### 1. Import Blueprint to Make.com
1. Go to [Make.com](https://www.make.com) → Scenarios → Import Blueprint
2. Import `CLEAN_BLUEPRINT.json`
3. Copy the webhook URL from Module 11

### 2. Configure Connections
- **Module 25**: Connect Google Drive
- **Module 26**: Connect Google Docs
- **Module 87**: Brandfetch API key is pre-configured

### 3. Run Frontend
```bash
npm install
npm run dev
```
Open http://localhost:3000

### 4. Test
1. Enter a company URL (e.g., `https://stripe.com`)
2. Click "Generate Profile"
3. View: logos, colors, fonts, social links
4. Open Google Doc in Drive

## Files

| File | Description |
|------|-------------|
| `CLEAN_BLUEPRINT.json` | Make.com scenario (7 modules) |
| `app/page.tsx` | Next.js frontend |
| `index.html` | Standalone HTML frontend |

## Flow

```
Webhook → URL → Domain → Drive Folder → Brandfetch API → Google Doc → Response
```

## Support

Check:
1. Webhook URL is correct
2. Google connections are authorized
3. Brandfetch API key is valid
