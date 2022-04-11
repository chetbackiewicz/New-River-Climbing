<template>
  <div class="crags">
      <p v-if="crags.length === 0">No Crags Found</p>
      <crag-item v-else v-for="item in crags"
      v-bind:key="item.id" v-bind:crag="item"/>
  </div>
</template>

<script>
import CragItem from '@/components/CragItem';

export default {
    name: 'crags',
    components: {
        CragItem
    },
    computed: {
        crags() {
            const crags = this.$store.state.crags;
            return crags;
        }
    }

}
</script>

<style>

</style>