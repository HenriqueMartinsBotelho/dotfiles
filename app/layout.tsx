import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "NextNvim",
  description: "The Next NeoVim Distro",
};

import "./globals.css";
export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="it" className="dark">
      <body className="relative">
        <div id="app" className="min-h-[100dvh]">
          {children}
        </div>
      </body>
    </html>
  );
}
