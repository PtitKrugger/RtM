<template>
  <q-layout view="lHh Lpr lFf">

    <q-page-container>
      <q-page class="flex flex-center" style="min-height: 600px !important;">

      <router-view />
      </q-page>
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'MainLayout',
})
</script>
