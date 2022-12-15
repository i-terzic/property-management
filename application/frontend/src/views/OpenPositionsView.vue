<template>
  <div class="py-5">
    <div class="d-flex">
      <h1>Open Positions</h1>
      <v-spacer></v-spacer>
      <p>
        Saldo: <span v-if="saldo < 0" style="color: red"> {{ saldo }}</span>
        <span v-else-if="saldo > 0" style="color: green"> {{ saldo }}</span>
        <span v-else style="color: grey"> {{ saldo }}</span>
      </p>
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
    </EasyDataTable>
  </div>
</template>

<script>
import axios from "axios";
import _ from "lodash";
import { computed, onMounted, ref } from "vue";

export default {
  setup() {
    const headers = ref([
      { text: "Amount", value: "amount", sortable: true },
      { text: "Tenant", value: "tenantFirstName" },
    ]);
    const items = ref([]);

    onMounted(() => {
      axios.get("/api/open-position").then(({ data }) => {
        items.value = data;
      });
    });

    const saldo = computed(() => {
      return _(items.value).map("amount").sum();
    });

    return {
      headers,
      items,
      saldo,
    };
  },
};
</script>
