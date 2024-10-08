// import { ReactNode } from "react";
import clsx from "clsx";


export default function Section({
  heading,
  headingAlignment,
  children,
  invert = false,
}){
  return (
    <section
      className="col-reverse flex flex-col gap-2 md:flex-row md:gap-9"
      id={heading.toLowerCase().replace(/\s/g, "-")}
    >
      <h2
        className={clsx(
          "shrink-0 md:w-32",
          headingAlignment === "right" && "md:text-right",
          invert ? "font-medium text-text-light dark:text-text-dark" : "text-text-light dark:text-text-dark",
        )}
      >
        {heading}
      </h2>
      {children}
    </section>
  );
}