<template>
    <div>
        <h3>{{area.name}}</h3>
        <p>{{area.description}}</p>
        <p>{{area.directions}}</p>
    </div>


</template>

<script>
export default {
    name: 'area-item',
    props: ['area']
}
</script>

<style>

</style>