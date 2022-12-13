<template>
  <v-dialog v-model="dialog" width="750px">
    <template #activator="{ props }">
      <slot name="activator" :props="props"></slot>
    </template>

    <v-card title="Add Unit">
      <v-container>
        <v-form>
          <v-card-subtitle> Unit</v-card-subtitle>
          <v-card-text>
            <v-row>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.squareMeters"
                  label="Square Meters"
                  variant="outlined"
                  :rules="[rules.required]"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.nrRooms"
                  label="Number of rooms"
                  variant="outlined"
                  :rules="[rules.required]"
                  type="number"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="6">
                <v-text-field
                  v-model="editedItem.propertyID"
                  disabled
                  label="PropertyID"
                  variant="outlined"
                  type="number"
                ></v-text-field>
              </v-col>
            </v-row>
          </v-card-text>
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
            <v-btn
              variant="outlined"
              @click="saveItem(editedItem).then(closeDialog)"
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
    propertyId: {
      type: Number,
      required: true,
    },
  },
  emits: ["close"],
  setup(props, { emit }) {
    const dialog = ref(false);
    const closeDialog = () => {
      dialog.value = false;
      emit("close");
    };

    const editedItem = ref({
      nrRooms: 0,
      squareMeters: 0,
      propertyID: props.propertyId,
    });

    const rules = ref({
      required: (value) => (!!value === false ? "Required." : true),
    });

    const validate = (item) => {
      return Object.values(item)
        .map((item) => !!item)
        .every((item) => !!item);
    };

    const saveItem = (item) => {
      const valid = validate(item);

      if (!valid)
        return new Promise((resolve, reject) => {
          reject();
        });
      if (props.edit) return;
      return axios.post("/api/unit", {
        nrRooms: Number.parseInt(editedItem.value.nrRooms),
        squareMeters: Number.parseInt(editedItem.value.squareMeters),
        propertyID: props.propertyId,
      });
    };

    return {
      dialog,
      closeDialog,
      editedItem,
      saveItem,
      rules,
    };
  },
};
</script>
