import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Employer Profile Automation | AI-Powered Data Collection',
  description: 'Automated employer profile creation system with AI-powered data extraction, real-time processing, and intelligent analysis. Extract company data, logos, benefits, and more in seconds.',
  keywords: 'employer profiles, automation, AI, data extraction, web scraping, company data',
  authors: [{ name: 'Automated Employer Systems' }],
  viewport: 'width=device-width, initial-scale=1',
  themeColor: '#8B5CF6',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <head>
        <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>✨</text></svg>" />
      </head>
      <body className="antialiased">{children}</body>
    </html>
  )
}
