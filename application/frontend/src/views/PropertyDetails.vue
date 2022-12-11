<template>
  <div class="py-5">
    <div class="d-flex">
      <h1>Property Details</h1>
      <v-spacer></v-spacer>
      <v-btn variant="outlined">Add Unit</v-btn>
    </div>
    <v-row>
      <v-col cols="8">
        <EasyDataTable :headers="headers" :items="items" />
      </v-col>
      <v-col cols="4">
        <v-card flat border rounded class="white-card">
          <v-card-title> Owner </v-card-title>
          <v-card-text class="white-card">
            <v-list class="d-flex white-card">
              <v-list-item style="width: 150px !important">
                <v-list-item-title> First Name </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.ownerFirstName }}
                </v-list-item-subtitle>
              </v-list-item>

              <v-list-item>
                <v-list-item-title> Last Name </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.ownerLastName }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>

            <v-list class="d-flex white-card">
              <v-list-item>
                <v-list-item-title> Bank Account </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.ownerBankAccount }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>

        <br />
        <v-card flat border rounded class="white-card">
          <v-card-title> Property Address </v-card-title>
          <v-card-text>
            <v-list class="d-flex white-card">
              <v-list-item style="width: 150px !important">
                <v-list-item-title> Street </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.street }}
                </v-list-item-subtitle>
              </v-list-item>

              <v-list-item>
                <v-list-item-title> House Nr </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.houseNr }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>

            <v-list class="d-flex white-card">
              <v-list-item style="width: 150px !important">
                <v-list-item-title> Postal Code </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.postalCode }}
                </v-list-item-subtitle>
              </v-list-item>

              <v-list-item>
                <v-list-item-title> City </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.city }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>

            <v-list class="d-flex white-card">
              <v-list-item style="width: 150px !important">
                <v-list-item-title> Country </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.country }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>

        <br />
        <v-card flat border rounded class="white-card">
          <v-card-title> Property Information </v-card-title>
          <v-card-text>
            <v-list class="white-card">
              <v-list-item>
                <v-list-item-title> Number of Units </v-list-item-title>
                <v-list-item-subtitle>
                  {{ items.length }}
                </v-list-item-subtitle>
              </v-list-item>

              <v-list-item>
                <v-list-item-title>Manager </v-list-item-title>
                <v-list-item-subtitle>
                  {{ property.managerFirstName }} {{ property.managerLastName }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import axios from "axios";
import { onMounted, ref } from "vue";

export default {
  props: {
    id: {
      type: Number,
      required: true,
    },
  },
  setup(props) {
    const items = ref([]);
    const headers = ref([
      { text: "UnitID", value: "unitID", sortable: true },
      { text: "Square Meters", value: "squareMeters", sortable: true },
      { text: "Number of Rooms", value: "nrRooms", sortable: true },
    ]);

    const property = ref({});

    onMounted(() => {
      axios.get(`/api/unit?propertyID=${props.id}`).then(({ data }) => {
        items.value = data;
      });
      axios.get(`/api/property/${props.id}`).then(({ data }) => {
        property.value = data;
      });
    });

    const reloadUnits = () => {
      axios.get(`/api/unit?propertyID=${props.id}`).then(({ data }) => {
        items.value = data;
      });
    };

    return {
      items,
      headers,
      reloadUnits,
      property,
    };
  },
};
</script>

<style scoped>
.white-card {
  background-color: white !important;
}
</style>
