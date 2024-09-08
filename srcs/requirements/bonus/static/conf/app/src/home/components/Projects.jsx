import cv from '../../..//cv.json'

export const Projects = () => {
  const { projects } = cv.home

  return (
	<ul className="animated-list flex snap-x snap-mandatory grid-cols-2 flex-nowrap gap-9 overflow-x-scroll md:grid md:overflow-auto">
      {projects.map((project) => (
        <li
          key={project.name}
          className="col-span-1 min-w-72 snap-start transition-opacity"
        >
          <a href={project.url} target="_blank" rel="no-referrer" className="space-y-4">
            <div className="aspect-video overflow-hidden rounded-md bg-box-light dark:bg-box-dark">
                <img
                  src={project.image}
                  alt={project.name}
                  fill="cover"
                  className="h-full w-full mx-3 my-5 object-cover"
                />
            </div>
            <div className="space-y-1">
              <p className="font-medium leading-tight text-title-light dark:text-title-dark">{project.name}</p>
              <p className="text-text-light dark:text-text-dark">{project.summary}</p>
            </div>
          </a>
        </li>
      ))}
    </ul>
  )
}
