<script>
import { defineComponent } from 'vue';
import { useInfosStore } from 'src/stores/monStore.js';
import '../css/app.scss';

export default defineComponent ({
  name: 'TableauLignes',
  props: {
    taches: {default: () => [], Type: Object},
    etats: {default: () => [], Type: Object},
    importances: {default: () => [], Type: Object}
  },
  data() {
    return {
      columns: [ 
        { name: 'checkbox', label: '', field: row => row.id, sortable: false, align: 'center'},
        { name: 'etat', label: 'État', field: row => row.etat_id, sortable: true, align: 'center'},
        { name: 'importance', label: 'Importance', field: row => row.importance_id, sortable: true, align: 'center'},
        { name: 'descriptif', label: 'Descriptif', field: row => row.descriptif, sortable: true, align: 'center'}, 
        { name: 'created_at', label: 'Date de création', field: row => row.created_at, sortable: true, align: 'center'},
        { name: 'date_prevue', label: 'Date prévue', field: row => row.date_prevue, sortable: true, align: 'center'},
      ],
      store: useInfosStore()
    }
  },
});
</script>

<template>
  <transition appear enter-active-class="animated fadeIn" leave-active-class="animated fadeOut" :duration="3000">
    <q-table title="Tâches" :rows="taches" :columns="columns" separator="cell">
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td>
            <q-checkbox v-model="this.$parent.checkTaches" :val="props.row.id"/>
          </q-td>

          <q-td key="etat" :props="props"> 
            {{ this.etats[props.row.etat_id - 1].etat }}
          </q-td>

          <q-td key="importance" :props="props">
            <span :props="props" :style="{ backgroundColor: this.importances[props.row.importance_id - 1].codecouleur }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
          </q-td>

          <q-td key="descriptif">
            {{ props.row.descriptif }}
          </q-td>

          <q-td key="created_at">
            {{ new Date(props.row.created_at).toUTCString() }}
          </q-td>

          <q-td key="date_prevue">
            {{ new Date(props.row.date_prevue).toUTCString() }}
          </q-td>
        </q-tr>
      </template>
    </q-table>
  </transition>
</template>