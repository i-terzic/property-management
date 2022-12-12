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
    path: "/reports",
    name: "reports",
    component: () => import("../views/ReportsView.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
  {
    path: "/managed-properties",
    name: "managedProperties",
    component: () => import("../views/ManagedPropertiesView.vue"),
    meta: {
      keepAlive: false,
      backgroundColor: "white",
    },
  },
  {
    path: "/open-positions",
    name: "openPositions",
    component: () => import("../views/OpenPositionsView.vue"),
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
    path: "/managed-properties/:id",
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
