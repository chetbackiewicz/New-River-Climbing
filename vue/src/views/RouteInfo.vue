<template>
  <div class = "route-info">
      <header>
        <h1 id="route-name">
          {{$store.state.routeInfo.route_name}} {{$store.state.routeInfo.grade}}
        </h1>
      </header>
      <div class="top-of-page-display">
        <div id="route-information">
          <div id="rating">
          <h3>
          Rating:
          <img class = "star-img" src="../assets/star.png" alt="Number of stars" v-for="star in numberOfStars" v-bind:key="star.id">
          </h3>
          </div>
          <div class="type">
            <h3 id="type">
            Type:
          </h3>
          <p id="type" v-if="$store.state.routeInfo.sport_trad == 'S'">Sport</p>
          <p v-else>Trad</p>
          </div>
          <div class="height">
            <h3 id="height">
            Height:
          </h3>
          <p>{{$store.state.routeInfo.height}} ft</p>
          </div>
          <div class="protection">
            <h3 id="protection">Protection:</h3>
            <p class="bolts">{{$store.state.routeInfo.bolt_count}} bolts,</p>
            <p v-if="$store.state.routeInfo.has_anchors == true" class="anchors">bolt anchors</p>
            <p v-else>No Anchors</p>
          </div>
          <div class="route-description">
            <h3>
            Description 
          </h3>
          <p>{{$store.state.routeInfo.description}}</p>
          </div>
        </div>
        <div id="log-form">
          <log-form />
        </div>
        <div id="img-container">
        <img id="climb-img" v-bind:src="require('../assets/route-images/' + $store.state.routeInfo.route_name + '.jpg')"/>
        </div>
      </div>
        <route-item />
        <div class="center">
        <div class="form-input">
        <div class="preview">
            <img id="file-ip-1-preview">
        </div>
        <div id="image-submit">
            <label for="file-ip-1">Upload Image</label>
            <input type="file" id="file-ip-1" accept="image/*" v-on:change="getFile($event)">
            <label v-if="isPic" for="submit-image">Submit Photo</label>
            <!-- <button v-if="isPic" v-on:click="submitFile"></button> -->
            <input id="submit-image" type="button" v-on:click.prevent="submitFile">
        </div>
        </div>
        <div id="see-all-photos">
            <input v-if="showingImages" id="submit" type="button" value="Hide Photos" v-on:click.prevent="hideImages">
            <input v-else id="submit" type="button" value="See All Photos" v-on:click.prevent="displayImages">
        </div>
        <div>
            <div id="image-list">
        </div>
        <div id='route-comments'>
            <div class="form-field">
               <textarea type="text" id="routeComments" placeholder="Write a comment" v-model="userComment.comment"></textarea>
          </div>
          <div class="postComment">
              <input type="submit" id="postComment" v-on:click="postComment">
          </div>
            <h2 v-if="this.$store.state.routeComments.length == 0 && isCommentsLoaded">No comments, be the first to post!</h2>
            <route-comments-list v-else-if="isCommentsLoaded"/>
            <h2 v-else>Loading Comments...</h2>
          </div>
        </div>
      </div>
  </div>
</template>

<script>

import firebase from "firebase/compat/app"
import RouteItem from '@/components/RouteItem'
import routeService from '@/services/RouteService'
import commentService from '@/services/CommentService'
import RouteCommentsList from '@/components/RouteCommentsList.vue';
import LogForm from '@/components/LogForm'

export default {
  name: 'route-info',
  components: {
    RouteItem,
    LogForm,
    RouteCommentsList
  },
  data () {
      return {
        isPic: false,
        allImages: [],
        showingImages: false,
        routeName: "",
        storageRef: [],
        userComment: {
          username: this.$store.state.user.username,
          route_id: null,
          comment: "",
        },
        commentsLoaded: false,
        }
    },
  created() {
    // const areaName = this.$route.params.areaName;
    // const cragName = this.$route.params.cragName;
    this.routeName = this.$route.params.routeName;
    routeService.getRoute(this.routeName)
    .then(response => {
      this.$store.commit('SET_ROUTE_INFO', response.data);
      this.getRouteId();
    })

    commentService.getRouteComments(this.routeName)
      .then(response => {
        console.log(response.data)
          this.$store.commit('SET_ROUTE_COMMENTS', response.data);
          console.log("comments loaded")
          this.commentsLoaded = true;
      })
      .catch(error => {
          if (error.response) {
            this.errorMsg = `Error returned from server.  Received ${error.response.status} ${error.response.statusText}`;
          }
          else if (error.request) {
            this.errorMsg = 'Unable to connect to server';
          }
          else {
            this.errorMsg = 'Unknown error';
          }
        });

    this.storageRef = firebase.storage().ref(`route/${this.$route.params.routeName}`);
          this.storageRef.listAll().then((res) => {
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
    
    getRouteId() {
          this.userComment.route_id = this.$store.state.routeInfo.route_id
    },
    postComment() {
    commentService.addRouteComment(this.userComment.route_id, this.userComment)
    this.userComment.comment = "";
    window.location.reload()
  },
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
      const storage = firebase.storage().ref().child(`route/${this.$route.params.routeName}/${this.File.name}`).put(this.File);
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
  },
  computed: {
        isCommentsLoaded() {
        return this.commentsLoaded;
      },
    numberOfStars() {
      return (this.$store.state.routeInfo.rating);
    }
  }}
</script>

<style>



#route-name {
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  padding: 20px;
  margin: 0%;
}

.top-of-page-display {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: 
  "route-information img log-form";
}

#route-information {
  grid-area: route-information;
  padding-top: 2rem;
  margin-left: 2rem;
}

#log-form {
  grid-area: log-form;
  padding-top: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
}

.star-img {
  height: 1em;
}

.type {
  display: flex;
  align-items: baseline;
}

.type p {
  padding-left: 0.0em;
}

.height {
  display: flex;
  align-items: baseline;
}

.height p {
  padding-left: 0.1em;
}

.protection {
  display: flex;
  align-items: baseline;
}

.bolts {
  padding-right: 0.5em;
  padding-left: 0.0em;
}

.anchors {
  padding-left: 0em;
}

.route-description {
  display: block;
}

#height {
  padding-right: .5rem;
}

#type {
  padding-right: .5rem;
}

#protection {
  padding-right: .5rem;
}

#climb-img {
  grid-area: img;
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: 600px;
  border-radius: 25px;
  margin-top: 2rem;
  align-items: center;
}

#img-container {
  display: flex;
  justify-content: center;
  align-items: center;
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

#submit-image {
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


#submit-image:hover {
  background-color: #008CBA;
  color: white;
}


#routeComments {
  width: 80vw;
  height: 100px;
  margin-top: 12px;
  margin-bottom: 12px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: white;
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  font-size: 16px;
}

#postComment {
  border: none;
  color: black;
  border-radius: 25px;
  padding: 8px 16px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border: 1px solid grey;
}

#postComment:hover {
  background-color: #008CBA;
  color: white;
}

</style>