<template>
  <div class="py-5">
    <div>
      <h3>Create Service Charge Settlement</h3>
    </div>

    <EasyDataTable :headers="headers" :items="items">
      <template #item-lastName="{ lastName, firstName }">
        {{ lastName }}, {{ firstName }}
      </template>

      <template
        #item-bankAccount="{ tenantID, propertyID, firstName, lastName }"
      >
        <CreateSCSDialog
          :tenant-id="tenantID"
          :property-id="propertyID"
          :first-name="firstName"
          :last-name="lastName"
        >
          <template #activator="{ props }">
            <v-icon v-bind="props" icon="mdi-application-export"></v-icon>
          </template>
        </CreateSCSDialog>
      </template>
    </EasyDataTable>
  </div>
</template>

<script>
import axios from "axios";
import { onMounted, ref } from "vue";

import CreateSCSDialog from "@/components/CreateSCSDialog.vue";

export default {
  components: { CreateSCSDialog },
  setup() {
    const headers = ref([
      { text: "Tenant ID", value: "tenantID", sortable: true },
      { text: "Name", value: "lastName", sortable: true },
      { text: "Actions", value: "bankAccount", sortable: false },
    ]);
    const items = ref([]);

    onMounted(() => {
      axios.get("/api/tenant").then(({ data }) => {
        items.value = data;
      });
    });

    return {
      headers,
      items,
    };
  },
};
</script>
