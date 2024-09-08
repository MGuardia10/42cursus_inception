import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { PortfolioApp } from './PortfolioApp.jsx'
import './index.css'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <PortfolioApp />
  </StrictMode>,
)
