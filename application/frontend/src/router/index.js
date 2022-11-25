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
      backgroundColor: "#d2d2d2",
    },
  },
  {
    path: "/manager",
    name: "manager",
    component: () => import("../views/ManagerView.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
  {
    path: "/owner",
    name: "owner",
    component: () => import("../views/OwnerView.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
];

const router = createRouter({ history: createWebHashHistory(), routes });

export default router;
