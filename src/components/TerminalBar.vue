<script setup lang="ts">
defineProps({
  fileName: { type: String, default: 'helloworld.py' },
  centerText: { type: String, default: '' },
})
</script>

<template>
  <div class="flex item-center justify-between bg-[#2C2C2C] px-3 py-2">
    <!-- Traffic lights -->
    <div class="flex items-center gap-2">
      <span class="w-3.5 h-3.5 rounded-full bg-[#ff5f56] border border-black/30 shadow-sm"></span>
      <span class="w-3.5 h-3.5 rounded-full bg-[#ffbd2e] border border-black/30 shadow-sm"></span>
      <span class="w-3.5 h-3.5 rounded-full bg-[#27c93f] border border-black/30 shadow-sm"></span>
    </div>

    <!-- Filename -->
    <div>
      <span v-if="fileName" class="text-xs text-gray-400">{{ fileName }}</span>
    </div>
  </div>
</template>

<style scoped></style>
