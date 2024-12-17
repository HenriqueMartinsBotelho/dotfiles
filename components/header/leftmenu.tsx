"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

import { Tooltip } from "@nextui-org/react";

// Icons
import { Files } from "./icons/files";
import { Code, MessageCircle, Github, CircleUserRound, Settings, Braces } from "lucide-react";
import { FaHtml5, FaReact, FaCss3 } from "react-icons/fa6";
import { MdInfo } from "react-icons/md";

const LinkMenuIcon = [
  {
    href: "/",
    icon: Files,
    label: "Esplora risorse",
    filename: "index.html",
    iconFile: <FaHtml5 className="text-[#e65100]" />,
  },
  {
    href: "/projects",
    icon: Code,
    label: "Progetti",
    filename: "projects.json",
    iconFile: <Braces className="text-[#f9a825] size-[16px]" />,
  },
  {
    href: "/github",
    icon: Github,
    label: "Github",
    filename: "github.md",
    iconFile: <MdInfo className="text-[#42a5f5]" />,
  },
  {
    href: "/contact",
    icon: MessageCircle,
    label: "Contatti",
    filename: "contact.css",
    iconFile: <FaCss3 className="text-[#42a5f5]" />,
  },
  {
    href: "/about",
    icon: CircleUserRound,
    label: "Chi sono",
    filename: "about.jsx",
    iconFile: <FaReact className="text-[#0674b2]" />,
  },
  {
    href: "/settings",
    icon: Settings,
    label: "Impostazioni",
  },
];

const classLink =
  "size-[48px] flex items-center justify-center text-[var(--primary)] opacity-40 hover:opacity-100 transition-all duration-300 border-l-2 border-l-transparent";

export const LeftMenu = ({ children }: { children: React.ReactNode }) => {
  const pathname = usePathname();
  return (
    <div className="flex flex-row min-h-[calc(100dvh-35px-22px)]">
      {/* Left Menu */}
      <div className="bg-[var(--background)] w-full max-w-[48px] border border-[var(--border)] border-l-0">
        <div className="w-full h-full flex flex-col items-center justify-between">
          <ul>
            {LinkMenuIcon.slice(0, 4).map((item, index) => (
              <li key={index}>
                <Tooltip
                  content={item.label}
                  placement="right"
                  showArrow={true}
                  color="primary"
                  className="text-black !rounded-lg !px-2 !shadow-none !cursor-default"
                  delay={0}
                  closeDelay={0}
                >
                  <Link
                    href={item.href}
                    className={`${classLink} ${pathname === item.href
                      ? "!opacity-100 !border-l-[var(--primary)]"
                      : ""
                      }`}
                  >
                    <item.icon className="size-[24px]" />
                  </Link>
                </Tooltip>
              </li>
            ))}
          </ul>
          <ul>
            {LinkMenuIcon.slice(4, 6).map((item, index) => (
              <li key={index}>
                <Tooltip
                  content={item.label}
                  placement="right"
                  showArrow={true}
                  color="primary"
                  className="text-black !rounded-lg !px-2 !shadow-none !cursor-default"
                  delay={0}
                  closeDelay={0}
                >
                  <Link
                    href={item.href}
                    className={`${classLink} ${pathname === item.href
                      ? "!opacity-100 !border-l-[var(--primary)]"
                      : ""
                      }`}
                  >
                    <item.icon className="size-[24px]" />
                  </Link>
                </Tooltip>
              </li>
            ))}
          </ul>
        </div>
      </div>

      {/* Menu file */}
      <div className="bg-[var(--background)] lg:w-[200px] hidden lg:block ">
        <div className="w-full px-4 py-2">
          <p className="text-[11px] text-[var(--primary)] overflow-hidden whitespace-nowrap text-ellipsis cursor-default uppercase">Esplora risorse</p>
        </div>
        <ul>
          {LinkMenuIcon.slice(0, 5).map((item, index) => (
            <li key={index} className="">
              <Link href={item.href} className={`flex items-center justify-start gap-1.5 px-4 py-1 ${pathname === item.href ? "bg-[var(--background-secondary)]" : ""}`}>
                {item.iconFile }
                <p className="text-[13px] leading-none text-[var(--secondary)]">{item.filename}</p>
              </Link>
            </li>
          ))}
        </ul>
      </div>

      {/* Menu open file */}
      <div className="w-[90%] lg:w-full bg-[var(--background-secondary)]">
        <div className="w-full h-[35px]">
          <ul className="flex items-center justify-start h-full">
            {LinkMenuIcon.slice(0, 5).map((item, index) => (
              <li key={index} className="h-full">
                <Link href={item.href} className={`flex items-center justify-start h-full bg-[var(--background-inactive)] border-b border-b-transparent gap-1.5 px-4 py-1 ${pathname === item.href ? "!bg-[var(--background-active)] !border-b-[var(--border-active)]" : ""}`}>
                  {item.iconFile}
                  <p className="text-[13px] leading-none text-[var(--primary)]">{item.filename}</p>
                </Link>
              </li>
            ))}
          </ul>
        </div>
        {children}
      </div>
    </div>
  );
};
