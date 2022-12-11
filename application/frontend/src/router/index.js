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
  {
    path: "/data-import",
    name: "dataImport",
    component: () => import("../views/DataImport.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
  {
    path: "/manager/property/:id",
    name: "propertyDetails",
    component: () => import("../views/PropertyDetails.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
    props: (route) => ({ id: Number.parseInt(route.params.id) }),
  },
];

const router = createRouter({ history: createWebHashHistory(), routes });

export default router;
