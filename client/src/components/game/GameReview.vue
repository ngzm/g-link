<template>
  <v-dialog width="600" v-model="displayme">
    <v-card>
      <!-- game review form --> 
      <v-form v-model="valid" ref="form" lazy-validation>

        <!-- title --> 
        <v-card-title>
          <div>
            <h3 class="headline">評価・口コミ登録</h3>
            <div>{{ title }} は気に入りましたか？</div>
          </div>
        </v-card-title>

        <v-divider></v-divider>

        <!-- input field --> 
        <v-card-text>
          <div>
            <h3 class="title">評価</h3>
            <star-rating v-model="star"></star-rating>
          </div>
          <div>
            <h3 class="title">口コミ</h3>
            <v-text-field
              label="口コミ"
              v-model="comment"
              :counter="commentSize"
              :rules="commentRules"
              required
              textarea
            ></v-text-field>
          </div>
        </v-card-text>

        <v-divider></v-divider>

        <!-- action buttons --> 
        <v-card-actions>
          <v-spacer></v-spacer>
          <div>
            <v-btn dark class="blue" @click.native="register" :disabled="!valid" >登録する</v-btn>
            <v-btn dark class="grey" @click.native="setDialog(false)">やめる</v-btn>
          </div>
        </v-card-actions>

      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import StarRating from 'vue-star-rating';

const { mapState, mapMutations } = createNamespacedHelpers('greview');

export default {
  props: {
    title: { type: String, },
    dialog: { type: Boolean, },
    setDialog: { type: Function, },
  },
  data() {
    return {
      valid: true,
      commentSize: 150,
      commentRules: [
        (v) => !!v || '必ず入力してください',
        (v) => v.length <= this.commentSize || `${this.commentSize}文字以内で入力してください`
      ],
    };
  },
  computed: {
    displayme: {
      get: function() {
        return this.dialog;
      },
      set: function(flg) {
        this.setDialog(flg);
      },
    },
    star: {
      get: function() {
        return this.review.star || 0;
      },
      set: function(star) {
        this.setReview({ ...this.review, star });
      },
    },
    comment: {
      get: function() {
        return this.review.comment || '';
      },
      set: function(comment) {
        this.setReview({ ...this.review, comment });
      },
    },
    ...mapState([
      'review',
    ]),
  },
  methods: {
    register: function() {
      if (this.$refs.form.validate()) {
        this.$emit('onRegister', { comment: this.comment, star: this.star });
      }
    },
    ...mapMutations([
      'setReview',
    ]),
  },
  components: {
    StarRating
  },
};
</script>

<style>
</style>
