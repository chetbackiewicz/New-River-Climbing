<template>
    <div class="area-info">
        <h3 class="area-name">{{$store.state.areaInfo.name}}</h3>
        <p>{{$store.state.areaInfo.description}}</p>
        <p>{{$store.state.areaInfo.directions}}</p>
        <div>
            <p>List of Crags</p>
            <div v-bind:key="crag.id" v-for="crag in crags">
                <h4>{{crag.name}}</h4>
            </div>
        </div>
    </div>

</template>

<script>
import areaService from "@/services/AreaService"
import cragService from "@/services/CragService"

export default {
    name: 'area-info',
    data() {
        return {
            crags: this.$store.state.crags,
        }
    },
    created() {
        const areaName = this.$route.params.areaName;
        areaService.getAreaInformationByName(areaName)
        .then(response => {
            this.$store.commit('SET_AREA_INFO', response.data);
        });
        cragService.getCragsByAreaName(areaName)
        .then(response => {
            this.$store.commit('SET_CRAGS', response.data)
        })


    },
}
</script>

<style>

</style>