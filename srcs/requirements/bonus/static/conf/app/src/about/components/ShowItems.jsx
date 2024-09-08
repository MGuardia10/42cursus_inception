import clsx from "clsx";

function Items({ area, company, logo, url, date, key }) {

  const content = (
    <>
      <div className="flex items-center gap-4">
        <img
          src={logo}
          alt={company}
          width={48}
          height={48}
          className={clsx(
            "rounded-full",
            company === "University of Houston" && "bg-neutral-50"
          )}
        />
        <div className="flex flex-col gap-px">
          <p className={`text-title-light dark:text-title-dark ${url ? "external-arrow" : ""}`}>{area}</p>
          <p className="text-text-light dark:text-text-dark">{company}</p>
        </div>
      </div>
      {date && <time className="text-text-light dark:text-text-dark">{date}</time>}
    </>
  );

  return (
    <li className="transition-opacity" key={key}>
      {url ? (
        <a
          href={url}
		      target="_blank"
		      rel="noreferrer"
          className="flex justify-between w-full px-3 py-2 -mx-3 -my-2 no-underline"
        >
          {content}
        </a>
      ) : (
        <div className="flex justify-between ">{content}</div>
      )}
    </li>
  );
}

export default function ShowItems( {items} ) {
  return (
    <ul className="flex flex-col gap-8 animated-list">
      {items.map(Items)}
    </ul>
  );
}