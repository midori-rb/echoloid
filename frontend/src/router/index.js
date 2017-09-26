import VueRouter from 'vue-router';
import Blog from '@/pages/Blog';
import BlogList from '@/pages/BlogList';
import Login from '@/pages/Login';
import PanelAtom from '@/pages/PanelAtom';
import PanelEditor from '@/pages/PanelEditor';
import Welcome from '@/pages/Welcome';
import store from '@/store';

const routes = [
  {
    path: '/',
    title: 'Midori',
    component: Welcome,
  },
  {
    path: '/admin',
    title: 'Admin',
    redirect: '/admin/atom',
  },
  {
    path: '/admin/atom',
    title: 'Admin Panel: Atom Manage',
    component: PanelAtom,
  },
  {
    path: '/admin/editor',
    title: 'Admin Panel: Editor',
    component: PanelEditor,
  },
  {
    path: '/blog',
    title: 'Blog',
    redirect: '/blog/page/1',
  },
  {
    path: '/blog/page/:pageId',
    title: 'Blog',
    component: BlogList,
  },
  {
    path: '/blog/post/:postId',
    name: 'post',
    title: 'Blog',
    component: Blog,
  },
  {
    path: '/category/:categoryId',
    redirect: '/category/:categoryId/page/1',
  },
  {
    path: '/category/:categoryId/page/:pageId',
    title: 'Blog',
    component: BlogList,
  },
  {
    path: '/login',
    title: 'Login',
    component: Login,
  },
];

const router = new VueRouter({
  mode: 'history',
  routes,
});

router.beforeEach((to, _from, next) => {
  if (to.path.startsWith('/admin') && !store.state.user.logged) {
    return next('/login');
  }
  return next();
});

export default router;
