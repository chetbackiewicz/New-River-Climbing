<template>
    <div class="area">
        <router-link v-bind:to="{ name: 'area-information', params: {areaName: area.name}}">
            <h3 class="area-name">{{area.name}}</h3>
        </router-link>
    </div>


</template>

<script>
// import areaService from '@/services/AreaService'

export default {
    name: 'area-item',
    props: ['area']
}
</script>

<style>

</style>