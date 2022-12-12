<template>
  <div class="py-5">
    <div class="d-flex justify-space-between">
      <h1>Managed Properties</h1>
      <EditPropertyDialog @close="reloadManagedProperties">
        <template #activator="{ props }">
          <v-btn variant="outlined" v-bind="props">Add Property </v-btn>
        </template>
      </EditPropertyDialog>
    </div>

    <EasyDataTable :headers="headers" :items="items">
      <template #item-adressID="{ street, houseNr, city, postalCode, country }">
        {{ street }} {{ houseNr }}
        <br />
        {{ postalCode }} {{ city }}
        <br />
        {{ country }}
      </template>

      <template
        #item-ownerID="{ ownerFirstName, ownerLastName, ownerBankAccount }"
      >
        <strong>First Name:</strong> {{ ownerFirstName }} <br />
        <strong>Last Name:</strong> {{ ownerLastName }} <br />
        <strong>Bank Account: </strong>{{ ownerBankAccount }}
      </template>

      <template #item-nrUnits="{ propertyID }">
        <v-icon
          icon="mdi-pencil"
          @click="openPropertyDetails(propertyID)"
        ></v-icon>
      </template>
    </EasyDataTable>
  </div>
</template>

<script>
import axios from "axios";
import { onMounted, ref } from "vue";
import { useRouter } from "vue-router";

import EditPropertyDialog from "@/components/EditPropertyDialog.vue";

export default {
  components: { EditPropertyDialog },
  setup() {
    const items = ref([]);
    const headers = ref([
      { text: "PropertyID", value: "propertyID", sortable: true },
      { text: "Adress", value: "adressID" },
      { text: "Owner", value: "ownerID" },
      { text: "Actions", value: "nrUnits" },
    ]);

    onMounted(() => {
      axios.get("/api/property").then(({ data }) => {
        items.value = data;
      });
    });

    const reloadManagedProperties = () => {
      axios.get("/api/property").then(({ data }) => {
        items.value = data;
      });
    };

    const router = useRouter();

    const openPropertyDetails = (propertyID) => {
      router.push({ path: `/manager/property/${propertyID}` });
    };

    return {
      items,
      headers,
      reloadManagedProperties,
      openPropertyDetails,
    };
  },
};
</script>
