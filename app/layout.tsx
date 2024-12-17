import type { Metadata } from "next";
import { Ester } from "@/components/esteregg/ester";

export const metadata: Metadata = {
  title: "Portfolio di Andrea De Laurentis",
  description: "Portfolio di Andrea De Laurentis",
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
        <Ester />
      </body>
    </html>
  );
}
