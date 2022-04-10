<template>
    <div class="areas">
        <p v-if="areasList.length == 0">No Areas Found</p>
        <area-item v-else v-for="area in areasList" v-bind:key="area.id" v-bind:area="area" />  
    </div>
</template>

<script>
import AreaItem from "@/components/AreaItem"

export default {
    name: 'area-list',
    components: {
        AreaItem
    },
    data() {
        return {
            areas: []
        }
    },
    computed: {
        areasList() {
            const areas = this.$store.state.areas;
            return areas;
        }
    }
}
</script>

<style>

</style>