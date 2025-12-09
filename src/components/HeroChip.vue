<script setup lang="ts">
import type { Component } from 'vue'
defineProps({
  icon: { type: Object as () => Component | null, default: null },
  iconColor: { type: String },
  label: { type: String, default: '' },
})
</script>

<template>
  <div
    class="flex items-center gap-2 px-6 py-1.5 bg-(--card-bg-dark) border border-(--misc) rounded-[10px]"
  >
    <component :is="icon" class="w-5 h-5 text-orange-400" />
    <p class="text-sm font-medium">{{ label }}</p>
  </div>
</template>

<style scoped></style>
