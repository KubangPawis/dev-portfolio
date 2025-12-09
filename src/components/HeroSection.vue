<script setup lang="ts">
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
</script>

<template>
  <div class="rounded-2xl overflow-hidden">
    <TerminalBar />
    <div
      class="flex flex-col items-center justify-center text-center bg-(--card-bg) px-[124px] py-8 w-full h-full"
    >
      <img :src="ProfileImage" alt="Profile Avatar" class="w-[200px] h-[200px] mb-5 rounded-full" />
      <h1 class="text-4xl font-bold">{{ p.name }}</h1>
      <h2 class="mb-6 text-xl font-semibold text-(--hero-title-accent)">{{ p.title }}</h2>

      <!-- STATUS CHIPS -->
      <div class="mb-5 flex gap-2">
        <HeroChip :icon="LocationIcon" :label="p.location" />
      </div>

      <!-- BIO -->
      <p class="mb-4 text-sm/8 font-medium max-w-[70%]">{{ p.bio }}</p>

      <!-- SOCIALS -->
      <div class="flex gap-2">
        <EmailIcon class="w-7 h-7" />
        <GitHubIcon class="w-7 h-7" />
        <LinkedInIcon class="w-7 h-7" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
