/**
 * main.js
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */

// Components
import App from "./App.vue";
import router from "./router";

// Composables
import { createApp } from "vue";

// Plugins
import { registerPlugins } from "@/plugins";
import Vue3EasyDataTable from "vue3-easy-data-table";
import "vue3-easy-data-table/dist/style.css";

const app = createApp(App);

registerPlugins(app);

app.use(router);
app.component("EasyDataTable", Vue3EasyDataTable);

app.mount("#app");
