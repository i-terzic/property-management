<template>
  <v-dialog v-model="dialog" width="750px">
    <template #activator="{ props }">
      <slot name="activator" :props="props"></slot>
    </template>

    <v-card title="Create SCS Excel Export">
      <v-container>
        <v-form>
          <v-card-text>
            <v-row>
              <v-col cols="6">
                <v-autocomplete
                  v-model="year"
                  :items="yearItems"
                  label="Year"
                  variant="outlined"
                  type="number"
                ></v-autocomplete>
              </v-col>
              <v-col cols="6">
                <p>
                  This will generate Service Charge settlemetn in form of a
                  Excel File for {{ year }} and Tenant with ID: {{ tenantId }}
                </p>
              </v-col>
            </v-row>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="grey" @click="closeDialog">Cancel</v-btn>
            <v-btn
              color="primary"
              variant="outlined"
              @click="createSCS().then(closeDialog)"
              >Create</v-btn
            >
          </v-card-actions>
        </v-form>
      </v-container>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { ref } from "vue";
import generateSCSExcel from "../utils/pdfCreation";

export default {
  props: {
    tenantId: {
      required: true,
      type: Number,
    },
    propertyId: {
      required: true,
      type: Number,
    },
    firstName: {
      required: true,
      type: String,
    },
    lastName: {
      required: true,
      type: String,
    },
  },
  emits: ["close"],
  setup(props, { emit }) {
    const dialog = ref(false);
    const closeDialog = () => {
      dialog.value = false;
      emit("close");
    };

    const year = ref(2019);
    const yearItems = ref([2022, 2021, 2020, 2019, 2018, 2017]);

    const createSCS = async () => {
      return Promise.all([
        axios.get(`/api/property/${props.propertyId}`),
        axios.get(
          `/api/scs-position?tenantID=${Number.parseInt(
            props.tenantId
          )}&year=${Number.parseInt(year.value)}}`
        ),
        axios.get(
          `api/prepayment?tenantID=${Number.parseInt(
            props.tenantId
          )}&year=${Number.parseInt(year.value)}`
        ),
      ]).then(([propertyRes, scsPositionRes, prepaymentRes]) => {
        const { data: propertyData } = propertyRes;
        const { data: scsPositionData } = scsPositionRes;
        const { data: prepaymentData } = prepaymentRes;

        generateSCSExcel({
          propertyData,
          scsPositionData,
          prepaymentData,
          scsInfo: {
            year: year.value,
            firstName: props.firstName,
            lastName: props.lastName,
          },
        });
      });
    };

    return {
      dialog,
      closeDialog,
      year,
      createSCS,
      yearItems,
    };
  },
};
</script>
