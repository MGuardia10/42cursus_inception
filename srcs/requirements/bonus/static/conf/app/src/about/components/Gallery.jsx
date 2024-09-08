import { motion } from "framer-motion";
import clsx from "clsx";
// import localFont from 'next/font/local'

// import texas from "public/gallery/texas.jpg";
// import meLily from "public/gallery/me-lily.jpg";
// import colorado from "public/gallery/colorado.jpg";
// import cowboy from "public/gallery/cowboy-bike.webp";

// import Halo from "@/app/components/Halo";
import cv from "../../../cv.json"

// const ticketingFont = localFont({
//   src: "../../../public/ticketing.woff2",
//   display: "swap",
// });

function Photo({
  src,
  alt,
  caption,
  width,
  height,
  rotate,
  left,
  index,
  flipDirection,
  meta,
  children,
}) {
  const shared = "absolute h-full w-full rounded-xl overflow-hidden";
  return (
    <motion.div
      className={`absolute mx-auto cursor-grab hover:before:block hover:before:w-[calc(100%+55px)] hover:before:h-[300px] hover:before:absolute hover:before:-top-8 hover:before:-left-7`}
      style={{ rotate: `${rotate}deg`, left, width, height, perspective: 1000 }}
      initial={{
        width,
        height,
        rotate: (rotate || 0) - 20,
        y: 200 + index * 20,
        x: index === 1 ? -60 : index === 2 ? -30 : index === 3 ? 30 : 60,
        opacity: 0,
      }}
      transition={{
        default: {
          type: "spring",
          bounce: 0.2,
          duration:
            index === 1 ? 0.8 : index === 2 ? 0.85 : index === 3 ? 0.9 : 1,
          delay: index * 0.15,
        },
        opacity: {
          duration: 0.7,
          ease: [0.23, 0.64, 0.13, 0.99],
          delay: index * 0.15,
        },
        scale: { duration: 0.12 },
      }}
      animate={{ width, height, rotate, y: 0, opacity: 1, x: 0 }}
      drag
      whileTap={{ scale: 1.1, cursor: "grabbing" }}
      whileDrag={{ scale: 1.1, cursor: "grabbing" }}
      whileHover="flipped"
    >
      <motion.div
        className="relative w-full h-full shadow-md rounded-xl will-change-transform"
        style={{ transformStyle: "preserve-3d" }}
        transition={{ type: "spring", duration: 0.4 }}
        variants={{
          flipped: {
            scale: 1.1,
            rotateY: flipDirection === "right" ? -180 : 180,
            rotateX: 5,
          },
        }}
      >
        <div className={shared} style={{ backfaceVisibility: "hidden" }}>
          <img
            src={src}
            alt={alt}
            width={width}
            height={height}
            className="absolute inset-0 object-cover w-full h-full bg-neutral-400 pointer-events-none rounded-xl"
          />
          {children}
        </div>
        <div
          className={clsx(
            shared,
            "bg-[#FFFAF2] flex items-center rounded-xl overflow-hidden"
          )}
          style={{
            backfaceVisibility: "hidden",
            transform: "rotateY(180deg)",
          }}
        >
          <div className="flex items-center">
            <span className="absolute w-[500px] h-[500px] rotate-[-20deg] bg-repeat bg-[length:280px] bg-[url('/about/photopaper.webp')]" />
            <div className="z-[1] px-6">
              <div className="flex flex-col gap-1 uppercase font-mono text-xs">
                <p className="text-text-light">{caption}</p>
                {meta && <p className="text-sm text-text-light">{meta}</p>}
              </div>
            </div>
          </div>
        </div>
      </motion.div>
    </motion.div>
  );
}

export default function Gallery() {
  const { photos } = cv.about;
  return (
    <>
      <section className="flex gap-4 h-[268px] relative">
        <Photo
          src={photos[0].image}
          meta={photos[0].date}
		  caption={photos[0].caption}
          alt={photos[0].alt}
          width={280}
          height={239}
          rotate={-15}
          left={-50}
          index={1}
		  />
        <Photo
          src={photos[1].image}
          meta={photos[1].date}
		  caption={photos[1].caption}
          alt={photos[1].alt}
          width={280}
          height={280}
          rotate={10.3}
          left={160}
          index={2}
          flipDirection="left"
		  />
         <Photo
          src={photos[2].image}
          meta={photos[2].date}
		  caption={photos[2].caption}
          alt={photos[2].alt}
          width={220}
          height={280}
          rotate={-5.4}
          left={320}
          index={3}
		  />
        <Photo
          src={photos[3].image}
          meta={photos[3].date}
		  caption={photos[3].caption}
          alt={photos[3].alt}
          width={240}
          height={280}
          rotate={7.6}
          left={520}
          index={4}
          flipDirection="left"
        />
      </section>
    </>
  );
}