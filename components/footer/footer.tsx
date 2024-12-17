"use client";

import {
  Bell,
  CheckCheck,
  ChevronsRightLeft,
  CircleX,
  TriangleAlert,
  Braces,
} from "lucide-react";
import { Nextjs } from "./icons/nextjs";
import Link from "next/link";

export const Footer = () => {
  return (
    <footer
      id="status-bar"
      className="bg-gray-800 text-white text-sm fixed bottom-0 left-0 right-0 flex justify-between"
    >
      <div className="flex items-center">
        <span
          id="mode"
          className="bg-green-400 text-gray-800 font-bold px-2 py-1 mr-2"
        >
          HOME
        </span>
        <span id="file-info" className="px-2 py-1">
          home.html
        </span>
        <span id="file-type" className="px-2 py-1">
          html
        </span>
      </div>
      <div className="flex items-center">
        <span id="note" className="px-2 py-1">
          (:q = back | ESC = home)
        </span>
        <span id="encoding" className="px-2 py-1">
          utf-8
        </span>
        <span id="percentage" className="px-2 py-1">
          100%
        </span>
        <span
          id="line-col"
          className="bg-blue-400 text-gray-800 font-bold px-2 py-1 ml-2"
        >
          0:1
        </span>
      </div>
    </footer>
  );
};
