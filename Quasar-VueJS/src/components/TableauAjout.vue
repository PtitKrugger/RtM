<script>
import { defineComponent } from 'vue';
import api from 'axios'

export default defineComponent ({
  name: 'TableauAdd',
  data() {
    return {
      form: {
        descriptif: "",
        importance: "",
        date_prevue: ""
      },
      taskToUpload: {},
      showDialog: false
    }
  },
  methods: {
    showAddTache() {
      this.showDialog = true
    },

    async addTache() {
      this.taskToUpload = {
        id: this.$parent.taches.slice(-1)[0].id+1,
        descriptif: this.form.descriptif,
        created_at: new Date(),
        updated_at: new Date(),
        importance_id: this.form.importance.id,
        date_prevue: new Date(this.form.date_prevue),
        etat_id: 2
      }

      await api.post('http://localhost:3000/taches/', this.taskToUpload)
      this.$parent.taches = [...this.$parent.taches, {...this.taskToUpload, id: this.$parent.taches.slice(-1)[0].id+1}]
    },
  }
});
</script>

<template>
  <div class="q-pa-sm q-gutter-sm">
    <q-dialog v-model="showDialog">
      <q-card style="width: 750px; max-width: none;">
        <q-card-section>
          <div class="text-h6">Ajouter une tâche</div>
        </q-card-section>

        <q-card-actions align="evenly">
          <q-select v-model="form.importance" :options="this.$parent.importances" option-label="descriptif" transition-show="jump-up" transition-hide="jump-up" label="Importance" style="width: 175px" />
          <q-input v-model="form.descriptif" label="Descriptif"></q-input>
          <div>
            <q-input filled v-model="form.date_prevue" label="Date prévue">
              <template v-slot:prepend>
                <q-icon name="event" class="cursor-pointer">
                  <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                    <q-date v-model="form.date_prevue" mask="YYYY-MM-DD HH:mm">
                      <div class="row items-center justify-end">
                        <q-btn v-close-popup label="Enregistrer" color="primary" flat />
                      </div>
                    </q-date>
                  </q-popup-proxy>
                </q-icon>
              </template>

              <template v-slot:append>
                <q-icon name="access_time" class="cursor-pointer">
                  <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                    <q-time v-model="form.date_prevue" mask="YYYY-MM-DD HH:mm" format24h>
                      <div class="row items-center justify-end">
                        <q-btn v-close-popup label="Enregistrer" color="primary" flat />
                      </div>
                    </q-time>
                  </q-popup-proxy>
                </q-icon>
              </template>
            </q-input>
          </div>
        </q-card-actions>
        <q-card-actions style="height: 64px;" align="between">
            <q-btn flat label="Retour" color="primary" v-close-popup />
            <q-btn icon="send" flat label="Envoyer" color="primary" @click="addTache()" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

