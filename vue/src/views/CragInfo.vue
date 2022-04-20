<template>
  <div class="crag-info">
      <header>
          <h1 class="crag-name">
              {{$store.state.cragInfo.crag_name}}
          </h1>
      </header>
      <div>
        <h3 id="area-information">
          Description
      </h3>
      <p id="area-information">
          {{$store.state.areaInfo.description}}
      </p>
      <h3 id="area-information">
          Directions
      </h3>
      <p id="area-information">
          {{$store.state.areaInfo.directions}}
      </p>
      <div>
          <h3>List of Routes</h3>
          <route-list />
      </div>
      </div> 
      <div class="center">
        <div class="form-input">
        <div class="preview">
            <img id="file-ip-1-preview">
        </div>
        <div id="image-submit">
            <label for="file-ip-1">Upload Image</label>
            <input type="file" id="file-ip-1" accept="image/*" v-on:change="getFile($event)">
            <label v-if="isPic" for="submit">Submit Photo</label>
            <input id="submit" type="submit" v-on:click="submitFile">
        </div>
        </div>
        <div id="see-all-photos">
            <input v-if="showingImages" id="submit" type="submit" value="Hide Photos" v-on:click="hideImages">
            <input v-else id="submit" type="submit" value="See All Photos" v-on:click="displayImages">
        </div>
        <div>
            <div id="image-list">
            </div>
        </div>
      </div>
  </div>
</template>

<script>
import firebase from "firebase/compat/app"
import RouteList from '@/components/RouteList'
import routeService from '@/services/RouteService'

export default {
    name: 'crag-information',
    components: {
        RouteList
    },
    data () {
      return {
        isPic: false,
        allImages: [],
        showingImages: false
        }
    },
    created() {
        const areaName = this.$route.params.areaName;
        const cragName = this.$route.params.cragName;
        routeService.getRoutesByCragName(areaName, cragName)
        .then(response => {
            this.$store.commit('SET_ROUTES', response.data);
        })
        let storageRef = firebase.storage().ref(`crag/${this.$store.state.cragInfo.crag_name}`);
          storageRef.listAll().then((res) => {
              res.items.forEach((imageRef) => {
                  imageRef.getDownloadURL().then((url) => {
                    this.allImages = [...this.allImages, url];
                  })
              })
          })
          .catch((err) => {
              console.log(err)
          })
    }, 
    methods: {
        getFile(event) {
        this.File = event.target.files[0];
        this.preview = null;
        this.isPic = false;
        if (
          this.File.name.includes(".png") ||
          this.File.name.includes(".jpg")
        ) {
          let src = URL.createObjectURL(event.target.files[0]);
          let preview = document.getElementById("file-ip-1-preview");
          preview.src = src;
          preview.style.display = "block";
          this.isPic = true;
        }
      },
      submitFile() {
        console.log(this.$store.state.cragInfo.crag_name)
        const storage = firebase.storage().ref().child(`crag/${this.$store.state.cragInfo.crag_name}/${this.File.name}`).put(this.File);
        setTimeout(() => {
          storage.getDownloadURL().then((res) => (this.preview = res));
        }, 3000);
        this.isPic = false;
        let preview = document.getElementById("file-ip-1-preview");
        preview.src = "";
        alert("Image successfully submitted!\nIt will be added to this collection shortly\nHappy Climbing!");
      },
      displayImages() {
          if (this.allImages.length > 0) {
          document.getElementById('image-list')
          .innerHTML = '<img id="public-image" height="240" width="240" src="' + this.allImages.join('"/><img id="public-image" height="240" width="240" src="') + '"/>';
          } else {
              document.getElementById('image-list')
              .innerHTML = '<h3>No images available, upload your own!</h3>'
          }
          this.showingImages = !this.showingImages;
      },
      hideImages() {
          document.getElementById('image-list')
          .innerHTML = '<img id="public-image" src=""/>';
          this.showingImages = !this.showingImages;
      }
    }
}
</script>

<style>


.crag-name {
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  padding: 20px;
}

h3 {
    padding-left: 3rem;
    padding-right: 3rem;
}

p {
    padding-left: 3rem;
    padding-right: 3rem;
}

#see-all-photos {
    margin: 2rem;
}

#image-list {
    display: inline-flex;
    flex-wrap: wrap;
}

#public-image {
    margin: 2rem;
}

.center {
  height:100%;
  display:flex;
  flex-direction: column;
  align-items:center;
  justify-content:center;
  margin-top: 4rem;

}
.form-input {
  width:350px;
  padding:20px;
  background:#fff;
  box-shadow: -3px -3px 7px rgba(94, 104, 121, 0.377),
              3px 3px 7px rgba(94, 104, 121, 0.377);
}

.form-input img {
  width:100%;
  display:none;
  margin-bottom:30px;
}

.form-input input {
  display:none;
}

.form-input label {
  display:block;
  width:45%;
  height:45px;
  margin-left: 25%;
  line-height:50px;
  text-align:center;
  background:#1172c2;
  color:#fff;
  font-size:15px;
  font-family:"Open Sans",sans-serif;
  text-transform:Uppercase;
  font-weight:600;
  border-radius:5px;
  cursor:pointer;
}

#submit {
  border: none;
  color: black;
  border-radius: 25px;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border: 1px solid grey;
}


#submit:hover {
  background-color: #008CBA;
  color: white;
}

</style>