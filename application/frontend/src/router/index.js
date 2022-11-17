import { createRouter, createWebHashHistory } from "vue-router";

const routes = [
  {
    path: "/",
    name: "home",
    component: () => import("../views/HomeView.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
  {
    path: "/tenant",
    name: "tenant",
    component: () => import("../views/TenantView.vue"),
    meta: {
      keepAlive: false,
    },
  },
  {
    path: "/manager",
    name: "manager",
    component: () => import("../views/ManagerView.vue"),
    meta: {
      keepAlive: false,
    },
  },
  {
    path: "/owner",
    name: "owner",
    component: () => import("../views/OwnerView.vue"),
    meta: {
      keepAlive: false,
    },
  },
];

const router = createRouter({ history: createWebHashHistory(), routes });

export default router;
