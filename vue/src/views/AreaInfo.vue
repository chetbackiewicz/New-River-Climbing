<template>
    <div class="area-info">
        <header>
        <h1 class="area-name">{{$store.state.areaInfo.area_name}}</h1>
        </header>
        <h3>Description</h3>
        <p>{{$store.state.areaInfo.description}}</p>
        <h3>Directions</h3>
        <p>{{$store.state.areaInfo.directions}}</p>
        <div>
            <h3>List of Crags</h3>
            <crag-list />
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
          <div id='area-comments'>
            <div class="form-field">
               <textarea type="text" id="comments" placeholder="Write a comment" v-model="userComment.comment"></textarea>
          </div>
          <div class="postComment">
              <input type="submit" id="postComment" v-on:click="postComment">
          </div>
            <h2 v-if="userComment.length == 0 && isCommentsLoaded">No comments, be the first to post!</h2>
            <area-comments-list v-else-if="isCommentsLoaded"/>
            <h2 v-else>Loading Public Comments...</h2>
          </div>
        </div>
      </div>
    </div>

</template>

<script>
import areaService from "@/services/AreaService"
import cragService from "@/services/CragService"
import CragList from "@/components/CragList"
import commentService from '@/services/CommentService'
import AreaCommentsList from '@/components/AreaCommentsList.vue';
import firebase from "firebase/compat/app"


export default {
    name: 'area-info',
    components: {
        CragList,
        AreaCommentsList
    },
    data () {
      return {
        isPic: false,
        allImages: [],
        showingImages: false,
        userComment: {
          username: this.$store.state.user.username,
          area_id: this.$store.state.areaInfo.area_id,
          comment: "",
        },
        commentsLoaded: false
      }
    },
    created() {
        const areaName = this.$route.params.areaName;
        areaService.getAreaInformationByName(areaName)
        .then(response => {
            this.$store.commit('SET_AREA_INFO', response.data);
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
        cragService.getCragsByAreaName(areaName)
        .then(response => {
            this.$store.commit('SET_CRAGS', response.data);
            this.$store.commit('SET_CURRENT_AREA', areaName);
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
      commentService.getAreaComments(areaName)
      .then(response => {
          this.$store.commit('SET_AREA_COMMENTS', response.data);
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
       let storageRef = firebase.storage().ref(`area/${this.$store.state.areaInfo.area_name}`);
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
        const storage = firebase.storage().ref().child(`area/${this.$store.state.areaInfo.area_name}/${this.File.name}`).put(this.File);
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
      },
      postComment() {
        commentService.addAreaComment(this.$store.state.areaInfo.area_name, this.userComment)
        this.userComment.comment = "";
        window.location.reload()

      }
    },
    computed: {
      isCommentsLoaded() {
        return this.commentsLoaded;
      }
    }
}
</script>

<style>

#comments {
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

  .area-name {
    background: rgba(0, 0, 0, 0.5);
    color: #f1f1f1;
    padding: 20px;
    margin: 0%;
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