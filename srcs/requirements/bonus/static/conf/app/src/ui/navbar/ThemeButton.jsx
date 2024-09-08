import { useContext, useRef, useState } from 'react'
import { BsSun, BsMoonFill } from 'react-icons/bs'
import { ThemeContext } from '../../context/ThemeContext'

export const ThemeButton = () => {
  const isDark = document.documentElement.className === 'dark'
  const { setTheme } = useContext(ThemeContext)
  const [darkMode, setDarkMode] = useState(isDark)
  const toggleDarkMode = useRef(isDark)

  const onToggleDarkMode = () => {
    setDarkMode(!darkMode)
    toggleDarkMode.current = document.documentElement.classList.toggle('dark')
    if (toggleDarkMode.current) {
      localStorage.setItem('theme', 'dark')
      setTheme(localStorage.getItem('theme'))
    } else {
      localStorage.setItem('theme', '')
      setTheme(localStorage.getItem('theme'))
    }
  }

  return (
    <>
      <button
        aria-label='Theme Button'
        onClick={onToggleDarkMode}
        type='button'
        className='text-text-light dark:text-text-dark md:dark:hover:text-white p-2'
      >
        <BsMoonFill className={`w-4 h-4 ${(darkMode) ? '' : 'hidden'}`} />
        <BsSun className={`w-4 h-4 ${(darkMode) ? 'hidden' : ''}`} />
      </button>
    </>
  )
}