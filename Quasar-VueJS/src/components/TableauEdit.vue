<script>
import { defineComponent } from 'vue';
import api from 'axios'
var moment = require('moment'); // Extension pour formatter des dates pour envois des dates à RoR

export default defineComponent({
    name: 'TableauEdit',
    props: {
        taches: { default: () => [], Type: Object },
        etats: { default: () => [], Type: Object },
        importances: { default: () => [], Type: Object },
    },
    data() {
        return {
            index: "",
            id_infos: "",
            taskToUpdate: {
                etat_id: "",
                importance_id: "",
                descriptif: "",
                date_prevue: "",
            },
            showDialog: false,
        }
    },
    methods: {
        editTache() {
            this.showDialog = true

            this.index = this.taches.findIndex(t => t.id == this.$parent.checkTaches[0])
            this.id_infos = this.taches[this.index].id

            this.taskToUpdate.etat_id = this.taches[this.index].etat_id == 1 ? true : false
            this.taskToUpdate.importance_id = this.importances[this.taches[this.index].importance_id - 1].descriptif
            this.taskToUpdate.descriptif = this.taches[this.index].descriptif
            this.taskToUpdate.date_prevue = this.taches[this.index].date_prevue
        },
        checkEtatTache(etat) {
            if (etat == true) {
                return 1
            }
            else {
                return 2
            }
        },
        async updateTache() { 
            this.id = this.taches[this.taches.findIndex(t => t.id == this.$parent.checkTaches[0])].id
            
            this.taskToUpdate = { // Opérateurs ternaires, permettant d'affecter la valeur du champ si elle n'est pas la même que celle enregistrée, sinon définie en undefined 
                descriptif: this.taches[this.index].descriptif != this.taskToUpdate.descriptif ? this.taskToUpdate.descriptif : undefined, 
                importance_id: this.taches[this.index].importance_id != this.importances.findIndex(i => i.descriptif == this.taskToUpdate.importance_id).id ? this.importances.findIndex(i => i.descriptif == this.taskToUpdate.importance_id).id : undefined,
                date_prevue: moment(this.taches[this.index].date_prevue).format('YYYY-MM-DDTHH:MM') != moment(this.taskToUpdate.date_prevue).format('YYYY-MM-DDTHH:MM') ? this.taskToUpdate.date_prevue : undefined,
                etat_id: this.taches[this.index].etat_id != this.taskToUpdate.etat_id ? this.checkEtatTache(this.taskToUpdate.etat_id) : undefined
            }

            this.lenTask = Object.keys(this.taskToUpdate).length
            for (var i = this.lenTask - 1; i >= 0; i--) { // Boucle qui supprime toutes les clés qui ont la valeur undefined, pour mettre à jour seulement le nécessaire (ce qui a été changé) via la requête PATCH
                if (Object.values(this.taskToUpdate)[i] == undefined) {
                    delete this.taskToUpdate[Object.keys(this.taskToUpdate)[i]]
                }
            }

            this.lenTask = Object.keys(this.taskToUpdate).length
            if (this.lenTask != 0) { // Si y'a au moins une valeur d'un champ qui a changé
                await api.patch('http://localhost:3000/taches/' + this.id + '.json', this.taskToUpdate)
                for (var j = this.lenTask - 1; j >= 0; j--) { // Mise à jour en temps réel, via la liste tâches, sans faire appel à l'api
                    this.$parent.taches[this.index][Object.keys(this.taskToUpdate)[j]] = Object.values(this.taskToUpdate)[j]
                }
            }
        }
    }
});
</script>

<template v-slot:append>
    <div class="q-pa-sm q-gutter-sm">
        <q-dialog v-model="showDialog">
            <q-card style="width: 750px; max-width: none;">
                <q-card-section>
                    <div class="text-h6">Éditer une tâche</div>
                </q-card-section>
                <q-card-actions align="evenly">
                    <div style="display: block; text-align: center; height: 56px;">
                        <label class="text-caption" style="color: rgba(0, 0, 0, 0.6)">
                            État<br>
                        </label>
                        <q-checkbox size="md" v-model="taskToUpdate.etat_id" />
                    </div>
                    <q-select v-model="taskToUpdate.importance_id" :options="this.$parent.importances"
                        option-label="descriptif" transition-show="jump-up" transition-hide="jump-up" label="Importance"
                        style="width: 175px" />
                    <q-input v-model="taskToUpdate.descriptif" label="Descriptif" />
                    <div>
                        <q-input filled v-model="taskToUpdate.date_prevue" label="Date prévue">
                            <template v-slot:prepend>
                                <q-icon name="event" class="cursor-pointer">
                                    <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                                        <q-date v-model="taskToUpdate.date_prevue" mask="YYYY-MM-DD HH:mm">
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
                                        <q-time v-model="taskToUpdate.date_prevue" mask="YYYY-MM-DD HH:mm" format24h>
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
                    <q-btn flat label="Annuler" color="primary" v-close-popup />
                    <q-btn icon="save" flat label="Enregistrer" color="primary" @click="updateTache()" v-close-popup />
                </q-card-actions>
            </q-card>
        </q-dialog>
    </div>
</template>