"use client";

import React, { useState } from "react";

import { LogoIcon } from "@/components/logo/icon";

import {
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  useDisclosure,
} from "@nextui-org/react";

import Link from "next/link";


export const Header = () => {
  const {
    isOpen: isOpenClosePage,
    onOpen: onOpenClosePage,
    onOpenChange: onOpenChangeClosePage,
  } = useDisclosure();

  const [isEsterEgg, setIsEsterEgg] = useState(false);

  function esterEgg() {
    const app = document.querySelector("#app");
    const body = document.querySelector("body");
    const ester = document.querySelector("#ester");
    if (!isEsterEgg) {
      setIsEsterEgg(true);
      app?.classList.toggle("app-hide");
      body?.classList.toggle("overflow-hidden");
      ester?.classList.remove("hidden");
    } else {
      setIsEsterEgg(false);
      app?.classList.toggle("app-hide");
      setTimeout(() => {
        body?.classList.toggle("overflow-hidden");
        ester?.classList.add("hidden");
      }, 300);
    }
  }

  return (
    <header className="flex flex-row justify-between items-center p-2 px-4 h-[35px] bg-[var(--background)] border-b border-[var(--border)]">
      <div className="w-[52px] h-[20px]">
        <Link href="/">
          <LogoIcon fill="var(--primary)" className="h-full" />
        </Link>
      </div>
      <p className="text-xs text-primary">Andrea De Laurentis - Portfolio</p>
      <div className="h-full flex items-center gap-2">
        <button
          className="bg-yellow-500 size-3 rounded-full cursor-pointer"
          onClick={() => esterEgg()}
        />

        {/* Modale per fullscreen */}
        <button
          className="bg-green-500 size-3 rounded-full cursor-pointer"
          onClick={() => {
            if (!document.fullscreenElement) {
              document.documentElement.requestFullscreen();
            } else {
              document.exitFullscreen();
            }
          }}
        />

        {/* Modale per """chiudere""" il progetto */}
        <button
          className="bg-red-500 size-3 rounded-full cursor-pointer"
          onClick={onOpenClosePage}
        />
        <Modal
          isOpen={isOpenClosePage}
          onOpenChange={onOpenChangeClosePage}
          placement="center"
        >
          <ModalContent>
            {(onCloseClosePage) => (
              <>
                <ModalHeader className="flex flex-col gap-1">
                  Stai per chiudere il progetto!!
                </ModalHeader>
                <ModalBody>
                  <p>Sei sicuro di voler chiudere il progetto?</p>
                  <p className="opacity-50 text-xs mt-2">
                    Se premi &quot;Avanti&quot; le modifiche che sono state
                    fatte non saranno salvate.
                  </p>
                </ModalBody>
                <ModalFooter>
                  <Button variant="light" onPress={onCloseClosePage}>
                    Annulla
                  </Button>
                  <Button
                    variant="light"
                    color="danger"
                    onPress={() =>
                      (window.location.href = "https://www.google.com")
                    }
                  >
                    Avanti
                  </Button>
                </ModalFooter>
              </>
            )}
          </ModalContent>
        </Modal>
      </div>
    </header>
  );
};
