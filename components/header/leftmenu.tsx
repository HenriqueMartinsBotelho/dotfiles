"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

import { Tooltip } from "@nextui-org/react";

// Icons
import { Files } from "./icons/files";
import {
  Code,
  MessageCircle,
  Github,
  CircleUserRound,
  Settings,
  Braces,
} from "lucide-react";
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
    <div className="flex flex-row h-screen">
      {/* Menu file */}
      <div className="bg-[var(--background)] lg:w-[200px] hidden lg:block ">
        <ul>
          {LinkMenuIcon.slice(0, 5).map((item, index) => (
            <li key={index} className="">
              <Link
                href={item.href}
                className={`flex items-center justify-start gap-1.5 px-4 py-1 ${pathname === item.href ? "bg-[var(--background-secondary)]" : ""}`}
              >
                {item.iconFile}
                <p className="text-[13px] leading-none text-[var(--secondary)]">
                  {item.filename}
                </p>
              </Link>
            </li>
          ))}
        </ul>
      </div>

      <div className="w-[90%] lg:w-full bg-[var(--background-secondary)]">
        {children}
      </div>
    </div>
  );
};
