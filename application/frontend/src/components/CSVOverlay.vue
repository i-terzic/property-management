<template>
  <v-overlay v-model="showOverlay" contained class="justify-center pt-10">
    <template #activator="{ props }">
      <slot name="activator" :props="props"></slot>
    </template>
    <v-card width="450px">
      <v-card-title class="d-flex align-center">
        Import CSV Data <v-spacer></v-spacer>
        <v-icon icon="mdi-close" @click="closeOverlay"></v-icon>
      </v-card-title>
      <v-divider></v-divider>
      <v-card-text>
        <p>
          In order to import transactional data, you have to provide records in
          a <code>.txt</code> or <code>.csv</code> file.
        </p>
        <br />
        <p>
          Each line represents a record and should be in the following format.
        </p>
        <br />
        <p>The format of the CSV file should be:</p>
        <p>
          <code>CSV;Format;tbd.;</code>
        </p>
        <br />
        <p>
          Alternatively, you can copy and paste your file into the text area on
          the left side.
        </p>
        <p>
          <strong>Note:</strong> If you enter something into the textarea the
          file input will be disabled
        </p>
      </v-card-text>
    </v-card>
  </v-overlay>
</template>

<script>
import { ref } from "vue";

export default {
  setup() {
    const showOverlay = ref(false);

    const closeOverlay = () => {
      showOverlay.value = false;
    };

    return {
      showOverlay,
      closeOverlay,
    };
  },
};
</script>
