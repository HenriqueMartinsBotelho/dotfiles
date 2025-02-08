"use client";
import React, { useState, useEffect } from "react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { LeftMenu } from "@/components/header/leftmenu";
import { Header } from "@/components/header/header";
import { Footer } from "@/components/footer/footer";

export default function CodeBlock() {
  const [markdown, setMarkdown] = useState("");

  useEffect(() => {
    fetch("/page.md")
      .then((res) => res.text())
      .then((text) => setMarkdown(text))
      .catch((err) => console.error("Error loading markdown:", err));
  }, []);

  return (
    <>
      <Header />
      <LeftMenu>
        <div className="prose prose-neutral max-w-none p-4">
          <ReactMarkdown remarkPlugins={[remarkGfm]}>{markdown}</ReactMarkdown>
        </div>
      </LeftMenu>
      <Footer />
    </>
  );
}
