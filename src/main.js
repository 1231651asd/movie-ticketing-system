import axios from 'axios'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(ElementPlus)
app.use(createPinia())
app.use(router)

import * as ElIcon from '@element-plus/icons-vue'

Object.keys(ElIcon).forEach((key) => {
    app.component(key, ElIcon[key])
})

app.mount('#app')
