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

      <template #item-tenantFirstName="{ firstName, lastName }">
        {{ lastName }}, {{ firstName }}
      </template>

      <template #item-street="{ street, houseNr, city, postalCode, country }">
        {{ street }} {{ houseNr }}
        <br />
        {{ postalCode }} {{ city }}
        <br />
        {{ country }}
      </template>

      <template #item-date="{ date }">
        {{ formatDate(date) }}
      </template>
    </EasyDataTable>
  </div>
</template>

<script>
import axios from "axios";
import moment from "moment";
import { onMounted, ref } from "vue";
export default {
  setup() {
    const headers = ref([
      { text: "Amount", value: "amount", sortable: true },
      { text: "Tenant", value: "tenantFirstName" },
      { text: "Date", value: "date" },
    ]);
    const items = ref([]);

    onMounted(() => {
      axios.get("/api/open-position").then(({ data }) => {
        items.value = data;
      });
    });

    const formatDate = (date) => moment(date).format("DD.MM.YYYY");
    return {
      headers,
      items,
      formatDate,
    };
  },
};
</script>
