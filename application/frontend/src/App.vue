<template>
  <v-app>
    <v-navigation-drawer rail expand-on-hover color="#27292F" theme="dark">
      <!-- TODO: add navigation items here -->
      <v-list nav>
        <v-list-item prepend-avatar="https://randomuser.me/api/portraits/men/85.jpg" title="Master User"
          subtitle="Master.User@gmail.com"></v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item :to="{ name: 'home' }" prepend-icon="mdi-home">
          Home
        </v-list-item>
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

    <v-app-bar color="white" elevation="1">
      <v-toolbar-title>
        <!-- TODO: Application Name -->
        Property Management
      </v-toolbar-title>

    </v-app-bar>

    <v-main>
      <v-sheet :color="currentRoute.meta.backgroundColor" style="height: calc(100vh - 64px)">
        <v-container>
          <!-- TODO: Add router-views -->
          <router-view></router-view>
        </v-container>
      </v-sheet>
    </v-main>
  </v-app>
</template>

<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
export default {
  setup() {
    const drawer = ref(false);

    const router = useRouter()
    const { currentRoute } = router;

    return {
      drawer,
      currentRoute
    }
  }
}
</script>
