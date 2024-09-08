import { Link } from "react-router-dom"
import { SiGmail, SiLinkedin, SiGithub, Si42 } from "react-icons/si";

import cv from "../../cv.json"

export const LinksPage = () => {
  const { profiles } = cv
  const { fullname, image } = cv.home

  return (
    <>
    <div className="flex flex-col gap-16 md:gap-24 max-w-lg mx-auto">
      <div className="flex animate-in flex-col gap-8">
        <img
          src={image}
          width={100}
          height={100}
          alt="avatar"
          className="mx-auto animate-in rounded-full bg-secondary"
          style={{ "--index": 1 }}
        />
        <div
          className="animate-in space-y-1 text-center"
          style={{ "--index": 2 }}
        >
          <h1 className="text-2xl font-bold tracking-tight text-title-light dark:text-title-dark">
            {fullname}
          </h1>
          <p className="mx-auto max-w-sm text-text-light dark:text-text-dark">
            Here are my socials and ways to connect with me.
          </p>
        </div>
      </div>
      <ul
        className="animated-list grid flex-grow animate-in grid-cols-1 gap-3"
        style={{ "--index": 3 }}
      >
        {profiles.map((profile) => (
          <li className="col-span-1 transition-opacity" key={profile.network}>
            <Link
              to={profile.url}
              target="_blank"
              rel="no-referrer"
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
            </Link>
          </li>
        ))}
      </ul>
    </div>
  </>
  )
}

export default LinksPage
