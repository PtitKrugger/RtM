<script>
import { defineComponent } from 'vue';
import api from 'axios'

export default defineComponent({
  name: 'TableauSuppr',
  data() {
    return {
      showDialog: false
    }
  },
  methods: {
    showSupprTache() {
      this.showDialog = true
    },

    async supprTache() {
      await api.delete('http://localhost:3000/taches/' + this.$parent.checkTaches + '.json')

      if (this.$parent.checkTaches.length == 1) { // Si il y a qu'une tâche à supprimer
        this.$parent.taches.splice(this.$parent.taches.findIndex(t => t.id === this.$parent.checkTaches[0]), 1)
      }

      else {
        for (var i = 0; i != this.$parent.checkTaches.length; i++) {
          this.$parent.taches.splice(this.$parent.taches.findIndex(t => t.id === this.$parent.checkTaches[0]), 1)
        }
      }

      this.$parent.checkTaches = []
    }
  }
});
</script>

<template>
  <div class="q-pa-sm q-gutter-sm">
      <q-dialog v-model="showDialog">
        <q-card style="width: 750px; max-width: none;">
          <q-card-section>
            <div class="text-h6">Supprimer tâche(s)</div>
          </q-card-section>
          <q-card-section class="text-body1">
            <div v-if="this.$parent.checkTaches.length == 1">Voulez-vous vraiment supprimer cette tâche ?</div>
            <div v-else>Voulez-vous vraiment supprimer ces tâches ?</div>
          </q-card-section>
          <q-card-actions align="between">
              <q-btn flat label="Retour" color="primary" v-close-popup />
              <q-btn icon="check" flat label="Confirmer" color="primary" @click="supprTache()" v-close-popup />
          </q-card-actions>
        </q-card>
      </q-dialog>
    </div>
</template>


