<script>
import { ref } from 'vue';
import { useInfosStore } from 'src/stores/monStore.js'; // Store utilisé par la page Options

import api from 'axios';


export default {
  name: 'OptionsPage',
  data() {
    return {
      show: ref('Importances'),
      store: useInfosStore(),
      importances: [],
      importanceForm: {
        descriptif: "",
        codeCouleur: ""
      },
    }
  },
  mounted() {
    this.importances = this.store.importances
  }
}
</script>


<template>
  <q-header elevated>
      <q-toolbar>

        <q-toolbar-title>
          Remember the Milk
        </q-toolbar-title>
        <transition appear enter-active-class="animated bounceIn" leave-active-class="animated bounceIn" duration="3000"> 
          <q-icon name="home" size="sm" class="cursor-pointer" @click="$router.push('/')" />
        </transition>
      </q-toolbar>
    </q-header>
  <q-page padding>
    <div class="fit row wrap justify-start items-start content-start" style="justify-content: center; padding-top: 80px;">     
      <transition appear enter-active-class="animated fadeIn" leave-active-class="animated fadeOut" duration="3000"> 
        <q-card>
          <q-tabs v-model="show" dense class="text-grey" active-color="primary" indicator-color="primary" align="justify" narrow-indicator>
            <q-tab name="Importances" label="Importances"></q-tab>
            <q-tab name="Autres" label="Autres"></q-tab>
          </q-tabs>

          <q-separator/>

          <q-tab-panels v-model="show" animated>
            <q-tab-panel name="Importances">
              <div class="text-h6">Importances</div>
              <q-select v-model="importanceForm.descriptif" :options="this.importances" option-label="descriptif" transition-show="flip-up" transition-hide="flip-down" style="width: 175px" />
            </q-tab-panel>

            <q-tab-panel name="Autres">
              <div class="text-h6">Autres</div>
            </q-tab-panel>
          </q-tab-panels>
        </q-card>
      </transition>
    </div>
  </q-page>
</template>
