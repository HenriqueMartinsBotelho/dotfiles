import React from "react";
import { Light as SyntaxHighlighter } from "react-syntax-highlighter";
import js from "react-syntax-highlighter/dist/esm/languages/hljs/javascript";
import { atomOneDark } from "react-syntax-highlighter/dist/esm/styles/hljs";
import { LeftMenu } from "@/components/header/leftmenu";
import { Header } from "@/components/header/header";
import { Footer } from "@/components/footer/footer";

SyntaxHighlighter.registerLanguage("javascript", js);

export default function CodeBlock() {
  const codeString = `# test <p>
              Lorem ipsum dolor sit amet...
            </p>
  `;

  return (
    <>
      <Header />
      <LeftMenu>
        <p>
          <div>
            <SyntaxHighlighter
              language="markdown"
              style={atomOneDark}
              showLineNumbers
            >
              {codeString}
            </SyntaxHighlighter>
          </div>
        </p>
      </LeftMenu>
      <Footer />
    </>
  );
}
