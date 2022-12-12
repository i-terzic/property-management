<template>
  <v-container>
    <div class="d-flex justify-center">
      <h1>Hello, what do you want to do today?</h1>
    </div>
    <div class="d-flex justify-space-between pt-5">
      <!-- Tenant card -->
      <v-card width="350px" color="primary" outlined>
        <v-card-title> Reports </v-card-title>
        <v-card-text>
          In this view you can create reports. Including the service charge
          settlement report.
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="primary"
            flat
            @click="navigateToView('reports')"
            >Navigate</v-btn
          >
        </v-card-actions>
      </v-card>

      <!-- Open Positions Card -->
      <v-card width="350px" color="secondary">
        <v-card-title> Open Positions </v-card-title>
        <v-card-text>
          In this view you can see all relevant information regarding open
          positions.
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="secondary"
            flat
            @click="navigateToView('openPositions')"
            >Navigate</v-btn
          >
        </v-card-actions>
      </v-card>

      <!-- Manager Card -->
      <v-card width="350px" color="ternary">
        <v-card-title> Managed Properties </v-card-title>
        <v-card-text>
          In this view you can see all relevant information regarding managed
          properties.
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="ternary"
            flat
            @click="navigateToView('managedProperties')"
            >Navigate</v-btn
          >
        </v-card-actions>
      </v-card>
    </div>
    <div class="d-flex justify-space-between pt-5">
      <v-card width="350px" color="primary">
        <v-card-title>Import CSV Data </v-card-title>
        <v-card-text>
          In this view you can import transactional data in form of a CSV file,
          which will be parsed on the DB and the values will be stored in the
          corresponding tables
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="primary"
            flat
            @click="navigateToView('dataImport')"
          >
            Navigate
          </v-btn>
        </v-card-actions>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import { useRouter } from "vue-router";

export default {
  setup() {
    const router = useRouter();
    const navigateToView = (viewName) => {
      router.push({ name: viewName });
    };

    return {
      navigateToView,
    };
  },
};
</script>
