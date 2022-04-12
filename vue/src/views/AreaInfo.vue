<template>
    <div class="area-info">
        <header>
        <h1 class="area-name">{{$store.state.areaInfo.name}}</h1>
        </header>
        <h3>Description</h3>
        <p>{{$store.state.areaInfo.description}}</p>
        <h3>Directions</h3>
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

   .area-name {
        display: flex;
        background-color: rgb(228, 166, 104);
    }

</style>