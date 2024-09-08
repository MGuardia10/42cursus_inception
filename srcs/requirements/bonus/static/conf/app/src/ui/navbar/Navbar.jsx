import { Fragment } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { Popover, PopoverButton, PopoverPanel, Transition } from '@headlessui/react'
import { HiBars3 } from "react-icons/hi2"

import LogoWhite from "/logo-white.svg"
import LogoBlack from "/logo-black.svg"
import { ThemeButton } from './ThemeButton'

const links = [
	{ label: "Home", href: "/" },
	{ label: "About", href: "/about" },
	{ label: "Links", href: "/links" },
];
  
export const Navbar = () => {
  const { pathname } = useLocation();
  
  return (
	<>
	<header className="md:pt-6">
      <nav className="mx-auto flex max-w-[700px] items-center justify-between gap-3 px-3.5 py-3">
        <Link to="/" className="shrink-0">
			<img src={LogoWhite} alt="Logo" width={40} height={40} className="hidden dark:flex"/>
			<img src={LogoBlack} alt="Logo" width={40} height={40} className="flex dark:hidden"/>
        </Link>
        <ul className="hidden items-center gap-2 text-sm md:flex text-text-light dark:text-text-dark ">
          {links.map((link) => (
            <li key={link.href} className={`py-1 px-3 rounded-md hover:dark:text-title-dark ${pathname === link.href ? 'text-title-light dark:text-title-dark bg-box-light dark:bg-box-dark' : ''}`}>
              <Link to={link.href} className="py-1">{link.label}</Link>
            </li>
          ))}
        </ul>

        <div className="ml-auto flex h-8 w-8 items-center justify-center md:ml-0">
		      <ThemeButton />
        </div>

        <Popover className="relative md:hidden text-title-light dark:text-title-dark">
            <PopoverButton className="flex h-8 w-8 items-center justify-center rounded-lg text-text-light dark:text-text-dark">
              <HiBars3 className="h-6 w-6 cursor-pointer text-secondary transition-colors hover:text-title-light hover:dark:text-title-dark" />
            </PopoverButton>
            <Transition
              as={Fragment}
              enter="transition ease-out duration-200"
              enterFrom="opacity-0 translate-y-1"
              enterTo="opacity-100 translate-y-0"
              leave="transition ease-in duration-150"
              leaveFrom="opacity-100 translate-y-0"
              leaveTo="opacity-0 translate-y-1"
            >
            <PopoverPanel className="absolute right-0 z-10 mt-2 w-40 origin-top-right overflow-auto rounded-xl bg-[#fafafa] dark:bg-[#0A0A0A] p-2 text-base shadow-md focus:outline-none sm:text-sm">
              <div className="grid">
                {links.map((link) => (
                  <Link
                    key={link.href}
                    to={link.href}
                    className={
                      `rounded-md px-4 py-2 transition-colors text-title-light dark:text-title-dark
                      ${pathname === link.href 
                        ? "bg-box-light dark:bg-box-dark font-medium"
                        : "font-normal"}`
                      }
                  >
                    {link.label}
                  </Link>
                ))}
              </div>
            </PopoverPanel>
          </Transition>
        </Popover>
      </nav>
    </header>
	</>
  )
}
