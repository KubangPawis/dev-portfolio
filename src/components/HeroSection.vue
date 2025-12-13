<script setup lang="ts">
import { defineComponent, h } from 'vue'

import ActiveIcon from './ActiveIcon.vue'
import DividerLine from './DividerLine.vue'
import TerminalBar from '@/components/TerminalBar.vue'
import HeroChip from '@/components/HeroChip.vue'
import ProfileImage from '@/assets/images/me_photo.jpg'
import profile from '@/data/profile.json'

import LocationIcon from '~icons/mdi/location-radius'
import EmailIcon from '~icons/mingcute/mail-fill'
import GitHubIcon from '~icons/simple-icons/github'
import LinkedInIcon from '~icons/entypo-social/linkedin-with-circle'

defineProps({
  width: { type: Number },
  height: { type: Number },
})

interface Profile {
  name: string
  title: string
  status: string
  location: string
  bio: string
}

const p = profile as Profile

const ActiveStatusIcon = defineComponent({
  name: 'ActiveStatusIcon',
  setup() {
    return () => h(ActiveIcon, { active: true, size: 22, color: '#31E862' })
  },
})

function highlightLabel(label: string, wordsToHighlight: string[]): string {
  for (let i = 0; i < wordsToHighlight.length; i++) {
    const word = wordsToHighlight[i]
    const regex = new RegExp(`(${word})`, 'gi')
    label = label.replace(regex, `<span class="highlighted-text">$1</span>`)
  }
  return label
}

const highlightedBio = highlightLabel(p.bio, ['Python', 'healthcare', 'financial'])
</script>

<template>
  <div class="rounded-2xl overflow-hidden">
    <TerminalBar />
    <div
      class="flex flex-col items-center justify-center text-center bg-(--card-bg) px-[136px] py-8 w-full h-full"
    >
      <img :src="ProfileImage" alt="Profile Avatar" class="w-[200px] h-[200px] rounded-full" />
      <DividerLine width="200px" marginTop="24px" marginBottom="24px" />
      <h1 class="text-4xl font-bold">{{ p.name }}</h1>
      <h2 class="mb-6 text-xl font-semibold text-(--hero-title-accent)">{{ p.title }}</h2>

      <!-- STATUS CHIPS -->
      <div class="mb-5 flex gap-2">
        <HeroChip :icon="ActiveStatusIcon" :label="p.status" />
        <HeroChip :icon="LocationIcon" :label="p.location" />
      </div>

      <!-- BIO -->
      <p class="text-sm/8 font-medium max-w-[65%]" v-html="highlightedBio"></p>

      <!-- SOCIALS -->
      <DividerLine width="70px" marginTop="24px" marginBottom="18px" />
      <div class="flex gap-2">
        <EmailIcon class="w-7 h-7" />
        <GitHubIcon class="w-7 h-7" />
        <LinkedInIcon class="w-7 h-7" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
