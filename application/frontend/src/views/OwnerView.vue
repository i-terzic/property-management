<template>
  <div class="py-5">
    <div>
      <h1>Open Positions</h1>
    </div>

    <EasyDataTable :headers="headers" :items="items">
      <template #item-amount="{ amount }">
        <span v-if="amount < 0" style="color: red"> {{ amount }}</span>
        <span v-else-if="amount > 0" style="color: green">{{ amount }}</span>
        <span v-else class="grey"> {{ amount }}</span>
      </template>

      <template #item-tenantFirstName="{ tenantFirstName, tenantLastName }">
        {{ tenantLastName }}, {{ tenantFirstName }}
      </template>

      <template #item-street="{ street, houseNr, city, postalCode, country }">
        {{ street }} {{ houseNr }}
        <br />
        {{ postalCode }} {{ city }}
        <br />
        {{ country }}
      </template>
    </EasyDataTable>
  </div>
</template>

<script>
import axios from "axios";
import { onMounted, ref } from "vue";
export default {
  setup() {
    const headers = ref([
      { text: "Id", value: "openPositionID", sortable: true },
      { text: "Description", value: "description" },
      { text: "Amount", value: "amount", sortable: true },
      { text: "Tenant", value: "tenantFirstName" },
      { text: "Adress", value: "street" },
    ]);
    const items = ref([]);

    onMounted(() => {
      axios.get("/api/open-position").then(({ data }) => {
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
