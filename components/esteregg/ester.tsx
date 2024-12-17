"use client";

import Image from "next/image";

export const Ester = () => {
  return (
    <div
      className="w-full h-full absolute top-0 left-0 right-0 bottom-0 z-0 hidden"
      id="ester"
    >
      <div className="w-full h-full flex flex-col justify-center items-center bg-black">
        <Image
          src="/img/sanic.webp"
          alt="Ester"
          width={300}
          height={300}
          className="h-[300px] w-auto"
          onClick={() => {
            const clicks = parseInt(localStorage.getItem("clicks") || "0") + 1;
            localStorage.setItem("clicks", clicks.toString());
            if (clicks >= 10) {
              window.location.href = "/computer";
              localStorage.setItem("clicks", "0");
            }
          }}
        />
        <p className="text-white text-center text-2xl font-bold">
          Non c&apos;è niente qui
        </p>
      </div>
    </div>
  );
};
