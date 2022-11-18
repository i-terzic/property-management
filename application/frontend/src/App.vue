<template>
  <v-app>
    <v-navigation-drawer rail expand-on-hover>
      <!-- TODO: add navigation items here -->
      <v-list nav>
        <v-list-item :to="{ name: 'home' }" prepend-icon="mdi-home">
          Home
        </v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item :to="{ name: 'tenant' }" prepend-icon="mdi-currency-usd">
          Tenant
        </v-list-item>
        <v-list-item :to="{ name: 'owner' }" prepend-icon="mdi-home">
          Owner
        </v-list-item>
        <v-list-item :to="{ name: 'manager' }" prepend-icon="mdi-account-edit">
          Manager
        </v-list-item>
      </v-list>

    </v-navigation-drawer>

    <v-app-bar>
      <v-toolbar-title>
        <!-- TODO: Application Name -->
        Property Management
      </v-toolbar-title>
    </v-app-bar>
    <v-main>
      <!-- TODO: Add router-views -->
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
import { ref } from "vue";
export default {
  setup() {
    const drawer = ref(false);

    return {
      drawer
    }
  }
}
</script>
