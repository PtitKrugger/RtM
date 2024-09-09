import { boot } from 'quasar/wrappers'
import { createPinia } from 'pinia'
import piniaPluginPersistedState from "pinia-plugin-persistedstate"


// "async" is optional;
// more info on params: https://v2.quasar.dev/quasar-cli/boot-files
export default boot(({ app }) => {
  const pinia = createPinia()
  pinia.use(piniaPluginPersistedState)
  app.use(pinia)
})
