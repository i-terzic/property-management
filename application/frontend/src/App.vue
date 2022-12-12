<template>
  <v-app>
    <v-app-bar flat color="primary" density="compact">
      <v-container style="max-width: 1200px" class="d-flex align-center">
        <v-toolbar-title>
          <!-- TODO: Application Name -->
          Property Management
        </v-toolbar-title>
        <v-toolbar-items variant="plain">
          <v-list-item :to="{ name: 'home' }" :active="false">
            Home
          </v-list-item>
          <v-list-item :to="{ name: 'reports' }" :active="false">
            Reports
          </v-list-item>
          <v-list-item :to="{ name: 'openPositions' }" :active="false">
            Open Positions
          </v-list-item>
          <v-list-item :to="{ name: 'managedProperties' }" :active="false">
            Managed Properties
          </v-list-item>
        </v-toolbar-items>
      </v-container>
    </v-app-bar>

    <v-main>
      <v-sheet
        :color="currentRoute.meta.backgroundColor"
        style="height: calc(100vh - 64px)"
      >
        <v-container style="max-width: 1200px">
          <!-- TODO: Add router-views -->
          <router-view />
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

    const router = useRouter();
    const { currentRoute } = router;

    return {
      drawer,
      currentRoute,
    };
  },
};
</script>
