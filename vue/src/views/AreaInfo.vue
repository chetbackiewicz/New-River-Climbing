<template>
    <div class="area-info">
        <h3 class="area-name">{{$store.state.areaInfo.name}}</h3>
        <h4>Description</h4>
        <p>{{$store.state.areaInfo.description}}</p>
        <h4>Directions</h4>
        <p>{{$store.state.areaInfo.directions}}</p>
        <div>
            <h3>List of Crags</h3>
            <crag-list />
        </div>
    </div>

</template>

<script>
import areaService from "@/services/AreaService"
import cragService from "@/services/CragService"
import CragList from "@/components/CragList"

export default {
    name: 'area-info',
    components: {
        CragList
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
        });
    },
}
</script>

<style>

</style>