<template>
  <div class="py-5">
    <v-row class="d-flex align-center">
      <h1>Import CSV Data</h1>

      <CSVOverlay>
        <template #activator="{ props }">
          <v-icon
            v-bind="props"
            class="ml-1"
            icon="mdi-information-outline"
          ></v-icon>
        </template>
      </CSVOverlay>
      <v-spacer></v-spacer>
      <v-btn
        variant="outlined"
        color="primary"
        :disabled="csvPlainText.length === 0"
        @click="importCSVData"
        >Import</v-btn
      >
    </v-row>
    <v-row cols="2" class="pt-10">
      <v-col cols="3">
        <v-file-input
          v-model="file"
          accept="text/csv, text/plain"
          variant="outlined"
          label="CSV File Input"
          :disabled="csvPlainText.length !== 0"
          @update:model-value="parseCSVFile"
        >
        </v-file-input>
      </v-col>
      <v-col cols="9">
        <v-textarea
          v-model="csvPlainText"
          label="Enter CSV Data here"
          variant="outlined"
          clearable
        ></v-textarea
      ></v-col>
    </v-row>
    <v-snackbar v-model="snackbar" :timeout="3000">
      {{ addedTransactions }}
    </v-snackbar>
  </div>
</template>

<script>
import { ref } from "vue";

import CSVOverlay from "@/components/CSVOverlay.vue";
import axios from "axios";
export default {
  components: { CSVOverlay },
  setup() {
    const showOverlay = ref(false);
    const csvPlainText = ref("");
    const addedTransactions = ref(false);

    const snackbar = ref(false);

    const file = ref([]);

    const importCSVData = () => {
      axios
        .post("/api/csv-import", { value: csvPlainText.value })
        .then((response) => {
          addedTransactions.value = `Added ${response.data.recordset[0].affectedRows} new transactions`;
        })
        .catch((e) => (addedTransactions.value = e));
      snackbar.value = true;
    };

    const parseCSVFile = (fileInput) => {
      if (fileInput.length === 0) return;
      const reader = new FileReader();
      reader.onload = () => {
        file.value = [];
        csvPlainText.value = reader.result;
      };

      reader.readAsText(fileInput[0]);
    };

    return {
      showOverlay,
      csvPlainText,
      file,
      importCSVData,
      parseCSVFile,
      snackbar,
      addedTransactions,
    };
  },
};
</script>
