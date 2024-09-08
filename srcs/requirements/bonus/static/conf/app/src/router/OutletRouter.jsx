import { Outlet, ScrollRestoration } from 'react-router-dom'
import { Navbar } from '../ui/navbar/Navbar.jsx'
import { ThemeProvider } from '../context/ThemeProvider'

export const OutletRouter = () => {
  return (
    <ThemeProvider>
      <main className="min-h-screen width-full bg-bg-light dark:bg-bg-dark text-primary antialiased">
        <ScrollRestoration />
        <Navbar />
        <div className="mx-auto max-w-[700px] px-6 pb-24 pt-16 md:pb-44 md:pt-20">
          <Outlet />
        </div>
      </main>
    </ThemeProvider>
  )
}