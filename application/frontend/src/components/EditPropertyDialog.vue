<template>
  <v-dialog v-model="dialog" width="750px">
    <template #activator="{ props }">
      <slot name="activator" :props="props"></slot>
    </template>

    <v-card title="Edit Properties">
      <v-container>
        <v-form>
          <v-card-subtitle> Owner</v-card-subtitle>
          <v-card-text>
            <v-row>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.firstName"
                  label="First Name"
                  variant="outlined"
                ></v-text-field>
              </v-col>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.lastName"
                  label="Last Name"
                  variant="outlined"
                ></v-text-field>
              </v-col>
            </v-row>

            <v-row>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.bankAccount"
                  label="Bank Account"
                  variant="outlined"
                ></v-text-field>
              </v-col>
            </v-row>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-subtitle class="pt-5">Property Adress</v-card-subtitle>
          <v-card-text>
            <v-row>
              <v-col cols="9">
                <v-text-field
                  v-model="editedItem.street"
                  label="Street"
                  variant="outlined"
                ></v-text-field>
              </v-col>
              <v-col cols="3">
                <v-text-field
                  v-model="editedItem.houseNr"
                  label="HouseNr"
                  variant="outlined"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="4">
                <v-text-field
                  v-model="editedItem.postalCode"
                  label="Postal Code"
                  variant="outlined"
                ></v-text-field>
              </v-col>
              <v-col cols="8">
                <v-text-field
                  v-model="editedItem.city"
                  label="City"
                  variant="outlined"
                ></v-text-field>
              </v-col>
            </v-row>
          </v-card-text>

          <v-divider></v-divider>
          <v-card-subtitle class="pt-5">Property Information</v-card-subtitle>
          <v-card-text>
            <v-row>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.nrUnits"
                  label="Number of units"
                  variant="outlined"
                ></v-text-field>
              </v-col>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.managerID"
                  label="ManagerID"
                  variant="outlined"
                  disabled
                ></v-text-field>
              </v-col> </v-row
          ></v-card-text>
          <v-divider></v-divider>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              variant="outlined"
              color="grey"
              @click="
                () => {
                  closeDialog();
                }
              "
              >Cancel</v-btn
            >
            <v-btn variant="outlined" @click="saveItem().then(closeDialog)"
              >Save</v-btn
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
export default {
  props: {
    edit: {
      type: Boolean,
      required: false,
    },
  },
  setup(props) {
    const dialog = ref(false);
    const closeDialog = () => {
      dialog.value = false;
    };

    const editedItem = ref({
      firstName: "",
      lastName: "",
      bankAccount: "",
      street: "",
      houseNr: null,
      city: "",
      postalCode: null,
      nrUnits: null,
      managerID: 1,
    });

    const saveItem = () => {
      if (!props.edit) return axios.post("/api/property", editedItem.value);
    };

    return {
      dialog,
      closeDialog,
      editedItem,
      saveItem,
    };
  },
};
</script>
