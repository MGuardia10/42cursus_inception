import { SiGmail, SiLinkedin, SiGithub, Si42 } from "react-icons/si";

import cv from "../../cv.json";
import Section from "./components/Section";
import Gallery from "./components/Gallery";
import ShowItems from "./components/ShowItems";


export const AboutPage = () => {
  const { bio, photos, work, education_intro, education } = cv.about
  const { profiles } = cv

  return (
    <div className="flex flex-col gap-16 md:gap-24">
      <div>
        <h1 className="animate-in text-3xl font-bold tracking-tight text-title-light dark:text-title-dark">
          About
        </h1>
        <p className="animate-in text-text-light dark:text-text-dark">
          A glimpse into me.
        </p>
      </div>
      <div className="mb-8 md:hidden">    
        <div 
          className="animate-in"
          style={{ "--index": 1 }}
        >
          <img
            src={photos[0].image}
            alt={photos[0].alt}
            width={324}
            height={139}
            className="pointer-events-none relative inset-0 h-64 -rotate-12 rounded-xl bg-gray-400 object-cover shadow-md"
          />
        </div>

        <div
          className="animate-in"
          style={{ "--index": 2 }}
        >
          <img
            src={photos[2].image}
            alt={photos[2].alt}
            width={220}
            height={260}
            className="pointer-events-none absolute inset-0 -top-64 left-[50%] w-48 rotate-6 rounded-xl bg-gray-400 object-cover shadow-md"
          />
        </div>
      </div>
      <div className="hidden md:block">
        <Gallery />
      </div>
      <div
        className="flex animate-in flex-col gap-16 md:gap-24"
        style={{ "--index": 3 }}
      >
        <Section heading="About" headingAlignment="left">
          <div className="flex flex-col gap-6 text-title-light dark:text-title-dark">
            {
              bio.map((paragraph, index) => (
                <p key={index}>{paragraph}</p>
              ))
            }
          </div>
        </Section>
        <Section heading="Connect" headingAlignment="left">
          <ul className="animated-list grid flex-grow grid-cols-1 gap-3 md:grid-cols-2">
            {profiles.map((profile) => (
              <li className="col-span-1 transition-opacity" key={profile.network}>
                <a
                  href={profile.url}
                  target="_blank"
                  rel="noreferrer"
                  className="inline-grid w-full rounded-lg p-4 no-underline transition-opacity bg-box-light dark:bg-box-dark"
                >
                  <div className="flex items-center gap-3 text-title-light dark:text-title-dark">
                    {profile.network === "Email" && <span className="text-xl"><SiGmail /></span>}
                    {profile.network === "LinkedIn" && <span className="text-xl"><SiLinkedin /></span>}
                    {profile.network === "GitHub" && <span className="text-xl"><SiGithub /></span>}
                    {profile.network === "42 Intra" && <span className="text-xl"><Si42 /></span>}
                    {profile.network}
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 20 20"
                      fill="currentColor"
                      className="ml-auto h-5 w-5 text-secondary"
                    >
                      <path
                        fillRule="evenodd"
                        d="M5.22 14.78a.75.75 0 001.06 0l7.22-7.22v5.69a.75.75 0 001.5 0v-7.5a.75.75 0 00-.75-.75h-7.5a.75.75 0 000 1.5h5.69l-7.22 7.22a.75.75 0 000 1.06z"
                        clipRule="evenodd"
                      />
                    </svg>
                  </div>
                </a>
              </li>
            ))}
          </ul>
        </Section>
        {/*
        <Section heading="Work" headingAlignment="left">
          <div className="flex w-full flex-col gap-8 text-title-light dark:text-title-dark">
            <p>
              I specialize in Python, data analytics, React, web development,
              UI/UX, and product design. But I am always learning new things.
              Here are some of the places I have worked.
            </p>
            <ShowItems items={ work } />
          </div>
        </Section> 
        */}
        <Section heading="Education" headingAlignment="left">
          <div className="flex w-full flex-col gap-8 text-title-light dark:text-title-dark">
            <p>
              {education_intro}
            </p>
            <ShowItems items={ education } />
          </div>
        </Section>
      </div>
    </div>
  );
}

export default AboutPage