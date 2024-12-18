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

  return (
    <header className="flex flex-row justify-between items-center p-2 px-4 hidden h-[10px] border-b border-[var(--border)]">
      <div className="h-full flex items-center gap-2">
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
