<template>
  <v-container>
    <div class="d-flex justify-center">
      <h1>Hello, what do you want to do today?</h1>
    </div>
    <div class="d-flex justify-space-between pt-5">
      <!-- Tenant card -->
      <v-card width="350px" color="primary" outlined>
        <v-card-title> Tenant </v-card-title>
        <v-card-text>
          In this view you can see all relevant information regarding the tenant
          view
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="primary"
            flat
            @click="navigateToView('tenant')"
            >Navigate</v-btn
          >
        </v-card-actions>
      </v-card>

      <!-- Owner Card -->
      <v-card width="350px" color="secondary">
        <v-card-title> Owner </v-card-title>
        <v-card-text>
          In this view you can see all relevant information regarding the Owner
          view
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="secondary"
            flat
            @click="navigateToView('owner')"
            >Navigate</v-btn
          >
        </v-card-actions>
      </v-card>

      <!-- Manager Card -->
      <v-card width="350px" color="ternary">
        <v-card-title> Manager </v-card-title>
        <v-card-text>
          In this view you can see all relevant information regarding the
          Manager view
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions style="background-color: white">
          <v-spacer></v-spacer>
          <v-btn
            variant="outlined"
            color="ternary"
            flat
            @click="navigateToView('manager')"
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
            color="ternary"
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
