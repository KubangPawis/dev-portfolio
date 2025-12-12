<script setup lang="ts">
const props = defineProps({
  width: { type: String, default: '400px' },
  marginTop: { type: String, default: '16px' },
  marginBottom: { type: String, default: '16px' },
})
</script>

<template>
  <div
    class="divider-line"
    :style="{ width: props.width, marginTop: props.marginTop, marginBottom: props.marginBottom }"
  ></div>
</template>

<style scoped>
.divider-line {
  height: 4px;
  background-color: #767391;
}
</style>
