import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import About from '@/components/About'
import Contact from '@/components/Contact'
import Login from '@/components/Login'
import Users from '@/components/Users'
import EditUser from '@/components/EditUser'
import AddUser from '@/components/AddUser'
import Jobs from '@/components/Jobs'
import AddJob from '@/components/AddJob'
import EditJob from '@/components/EditJob'
import Job from '@/components/Job'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/about',
      name: 'About',
      component: About
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    },
    {
      path: '/user/:id/edit',
      name: 'EditUser',
      component: EditUser
    },
    {
      path: '/user/add',
      name: 'AddUser',
      component: AddUser
    },
    {
      path: '/jobs',
      name: 'Jobs',
      component: Jobs
    },
    {
      path: '/job/add',
      name: 'AddJob',
      component: AddJob
    },
    {
      path: '/job/:id/edit',
      name: 'EditJob',
      component: EditJob
    },
    {
      path: '/job/:id/show',
      name: 'Job',
      component: Job
    }
  ]
})
