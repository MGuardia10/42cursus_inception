// importar componentes
import { Suspense, lazy } from 'react'
import { createBrowserRouter, Navigate, RouterProvider } from 'react-router-dom'
import { Spiner } from '../ui/Spiner'
import { OutletRouter } from './OutletRouter'

const HomePage = lazy(() => import('../home/HomePage'))
const AboutPage = lazy(() => import('../about/AboutPage'))
const LinksPage = lazy(() => import('../links/LinksPage'))

export const router = createBrowserRouter([
	{
	  path: '/',
	  element: <OutletRouter />,
	  children: [
		{
		  path: '/',
		  element: <Suspense fallback={<Spiner />}><HomePage /></Suspense>
		},
		{
			path: 'about',
			element: <Suspense fallback={<Spiner />}><AboutPage /></Suspense>
		},
		{
			path: 'links',
		    element: <Suspense fallback={<Spiner />}><LinksPage /></Suspense>
		},
		{
		  path: '*',
		  element: <Navigate to='/' />
		}
	  ]
	}
  ])
