<template>
   <div class="center">
   <div class="form-input">
   <div class="preview">
    <img id="file-ip-1-preview">
   </div>
    <label for="file-ip-1">Upload Image</label>
    <input type="file" id="file-ip-1" accept="image/*" v-on:change="getFile($event)">
    <label v-if="isPic" for="submit">Submit Photo</label>
    <input id="submit" type="submit" v-on:click="submitFile">
  </div>
</div> 
</template>


<script>
import firebase from "firebase/compat/app"

export default {
  data () {
    return {
      isPic: false
    }
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
        const storage = firebase.storage().ref().child(`${this.File.name}`).put(this.File);
        setTimeout(() => {
          storage.getDownloadURL().then((res) => (this.preview = res));
        }, 3000);
        this.isPic = false;
        let preview = document.getElementById("file-ip-1-preview");
        preview.src = "";
        alert("Image successfully submitted!\nThank you for contributing\nHappy Climbing!");
      },
  }
}
</script>

<style>
.center {
  height:100%;
  display:flex;
  align-items:center;
  justify-content:center;

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