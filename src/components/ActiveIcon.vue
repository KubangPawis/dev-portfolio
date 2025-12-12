<script setup lang="ts">
import type { Component } from 'vue'

const props = defineProps({
  icon: { type: Object as () => Component | null, default: null },
  size: { type: Number, default: 20 },
  active: { type: Boolean, default: false },
  color: { type: String, default: '#31E862' },
})
</script>

<template>
  <div class="ai-wrapper" :style="{ width: props.size + 'px', height: props.size + 'px' }">
    <component
      v-if="props.icon"
      :is="props.icon"
      class="ai-icon"
      :style="{ width: props.size + 'px', height: props.size + 'px', fontSize: props.size + 'px' }"
      aria-hidden="true"
    />
    <slot v-else></slot>

    <span
      v-if="props.active"
      class="ai-pulse"
      :style="{
        '--pulse-color': props.color,
        '--pulse-size': Math.max(6, Math.round(props.size * 0.45)) + 'px',
      }"
      aria-hidden="true"
    />
  </div>
</template>

<style scoped>
:root {
  --pulse-color: #31e862;
  --pulse-size: 16px;
}

.ai-wrapper {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  line-height: 0;
}

.ai-icon,
.ai-wrapper > svg,
.ai-wrapper > img {
  display: block;
}

.ai-pulse {
  position: absolute;
  width: var(--pulse-size, 8px);
  height: var(--pulse-size, 8px);
  border-radius: 999px;
  background: var(--pulse-color, #ef476f);
  transform-origin: center;
}

.ai-pulse::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: var(--pulse-color, #ef476f);
  opacity: 0.35;
  animation: ai-ping 1.6s infinite cubic-bezier(0.4, 0, 0.2, 1);
}

.ai-pulse::after {
  content: '';
  position: absolute;
  left: 50%;
  top: 50%;
  width: calc(var(--pulse-size, 8px) * 0.45);
  height: calc(var(--pulse-size, 8px) * 0.45);
  transform: translate(-50%, -50%);
  border-radius: 50%;
  background: var(--pulse-color, #ef476f);
  opacity: 0.95;
}

@keyframes ai-ping {
  0% {
    transform: scale(0.6);
    opacity: 0.6;
  }
  50% {
    transform: scale(1.6);
    opacity: 0.25;
  }
  100% {
    transform: scale(2.2);
    opacity: 0;
  }
}
</style>
