
import { defineStore } from 'pinia'

export const useCounterStore = defineStore('counter', () => {
  return {
    state: () => ({
      movieId: null,
      cinemaId: null,
    }),
  }

})
