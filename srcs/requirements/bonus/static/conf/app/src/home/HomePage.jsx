import React from 'react'
import { Link } from 'react-router-dom'
import { HiArrowUpRight } from "react-icons/hi2";
import cv from "../../cv.json"
import { Projects } from './components/Projects';

export const HomePage = () => {
  const { intro, summary, fast_links } = cv.home
  const { projects } = cv
  return (
    <section className="flex flex-col gap-16 md:gap-24">
    <div className="flex flex-col gap-8">
      <div className="space-y-4">
        <h1 className="animate-in text-3xl font-semibold tracking-tight text-title-light dark:text-title-dark">
          {intro}
        </h1>
        <p
          className="max-w-lg animate-in text-text-light dark:text-text-dark"
          style={{ "--index": 1 }}
        >
          {summary}
        </p>
      </div>
      <div
        className="flex animate-in gap-3 text-sm text-title-light dark:text-title-dark"
        style={{ "--index": 2 }}
      >
        {fast_links.map((link) => (
          <a
            className="flex w-fit px-3 py-1 no-underline items-center rounded-full bg-box-light dark:bg-box-dark hover:bg-box-light hover:bg-[#dddddd] hover:dark:bg-[#272727]"
            href={link.url}
            target="_blank"
            rel="no-referrer"
            key={link.name}
          >
            {link.name}
            <HiArrowUpRight className="ml-1.5 h-3 w-3 text-text-light dark:text-text-dark" />
          </a>
        ))
        }
      </div>
    </div>

    <div
      className="flex animate-in flex-col gap-8"
      style={{ "--index": 4 }}
    >
      <p className="tracking-tight text-text-light dark:text-text-dark">Pinned Projects</p>
      <Projects />
    </div>

  </section>
  )
}

export default HomePage
