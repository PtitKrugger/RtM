<script>
import { defineComponent, ref } from 'vue';
import { useInfosStore } from 'src/stores/monStore.js'; // Store utilisé par la page Options
import api from 'axios';
import '../css/app.scss';

import TableauAjout from 'src/components/TableauAjout.vue';
import TableauEdit from 'components/TableauEdit.vue';
import TableauSuppr from 'src/components/TableauSuppr.vue';
import TableauLignes from 'components/TableauLignes.vue';

export default defineComponent({
    name: 'IndexPage',
    setup() { // Setup pour pouvoir appeler les méthodes des composants enfants pour afficher les fenêtres de dialogue
        const childAjout = ref('childAjout');
        const childEdit = ref('childEdit');
        const childSuppr = ref('childSuppr');

        const childEditTache = () => {
            childEdit.value.editTache();
        };
        const childAjoutTache = () => {
            childAjout.value.showAddTache();
        };

        const childSupprTache = () => {
            childSuppr.value.showSupprTache();
        }

        return {
            childAjout,
            childAjoutTache,
            childEdit,
            childEditTache,
            childSuppr,
            childSupprTache
        };
    },
    data() {
        return {
            etats: [],
            importances: [],
            taches: [],
            checkTaches: [],
            store: useInfosStore()
        }
    },
    components: {
        TableauAjout,
        TableauEdit,
        TableauSuppr,
        TableauLignes
    },
    methods: {
        async getEtats() {
            const etats = await api.get('http://localhost:3000/etats.json')
            for (var j = 0; j != etats.data.length; j++) {
                var etat = {id: etats.data[j].id, etat: etats.data[j].etat}
                this.etats.push(etat)
            }
        },
        async getImportances() {
            const importances = await api.get('http://localhost:3000/importances.json')
            for (var i = 0; i != importances.data.length; i++) {
                var importance = {id: importances.data[i].id, descriptif: importances.data[i].descriptif, codecouleur: importances.data[i].codecouleur}
                this.importances.push(importance)
            }
        },
        async getTaches() {
            const taches = await api.get('http://localhost:3000/taches.json')
            for (var i = 0; i != taches.data.length; i++) {
                var tache = {id: taches.data[i].id, descriptif: taches.data[i].descriptif, created_at: taches.data[i].created_at, updated_at: taches.data[i].updated_at, importance_id: taches.data[i].importance_id, date_prevue: taches.data[i].date_prevue, etat_id: taches.data[i].etat_id}
                this.taches.push(tache)
            }
        },
        async loadAll() {
            await this.getEtats()
            await this.getImportances()
            await this.getTaches()
        },
        addInfosToStore() {
            this.store.taches = [...this.taches]
            this.store.etats = [...this.etats]
            this.store.importances = [...this.importances]
        },
    },
    async mounted() {
        await this.loadAll()
        this.addInfosToStore()
    }
});
</script>

<template>
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          Remember the Milk
        </q-toolbar-title>
        <transition appear enter-active-class="animated bounceIn" leave-active-class="animated bounceIn" duration="3000"> 
            <q-icon name="settings" size="sm" class="cursor-pointer" @click="$router.push('/options')" />
        </transition>
      </q-toolbar>
    </q-header>

    <transition appear enter-active-class="animated fadeIn" leave-active-class="animated fadeOut" duration="3000">
        <div class="fit row wrap justify-start items-start content-start" style="justify-content: center; padding-top: 80px;">
            <q-btn class="shadow-6" align="around" color="primary" label="Ajouter" icon="add" :disable="checkTaches.length != 0" @click="childAjoutTache()" rounded/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <q-btn class="shadow-6" align="around" color="green" label="Mettre à jour" icon="edit" :disable="checkTaches.length == 0 || checkTaches.length > 1" @click="childEditTache()" rounded/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <q-btn class="shadow-6" align="around" color="red" label="Supprimer" icon="delete" :disable="checkTaches.length == 0" @click="childSupprTache()" rounded/>
        </div>
    </transition>
    <TableauLignes :taches="this.taches" :etats="this.etats" :importances="this.importances" />
    <TableauAjout ref="childAjout" />
    <TableauEdit :taches="this.taches" :etats="this.etats" :importances="this.importances" ref="childEdit" />
    <TableauSuppr ref="childSuppr" />
</template>

