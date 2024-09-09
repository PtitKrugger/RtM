import { defineStore } from 'pinia';

export const useInfosStore = defineStore('infos', {
  state: () => {
    return {
      taches: [],
      etats: [],
      importances: []
    }
  },
  persist: true
});