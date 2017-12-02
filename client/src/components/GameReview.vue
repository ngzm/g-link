<template>
  <v-dialog width="600" v-model="displayme">
    <v-card>
      <v-form v-model="valid" ref="form" lazy-validation>
        <v-card-title>
          <div>
            <h3 class="headline">評価・口コミ登録</h3>
            <div>{{ title }} は気に入りましたか？</div>
          </div>
        </v-card-title>
        <v-divider></v-divider>
        <v-card-text v-show="accessible">
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
        <v-card-actions>
          <v-spacer></v-spacer>
          <div>
            <v-btn
              v-show="accessible"
              dark
              class="blue"
              @click.native="register"
              :disabled="!valid"
            >登録する</v-btn>
            <v-btn dark class="grey" @click.native="cancel">やめる</v-btn>
          </div>
        </v-card-actions>
      </v-form>
    </v-card>

    <div class="progress" v-show="notReady">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>

  </v-dialog>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import StarRating from 'vue-star-rating';
import { dataStatus } from '../stores/StoreStatus';

const { mapGetters, mapMutations } = createNamespacedHelpers('greview');

export default {
  props: {
    dialog: {
      type: Boolean,
    },
    setDialog: {
      type: Function,
    },
    title: {
      type: String,
    },
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
        return this.dialog && this.accessible;
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
        let rv = Object.assign(this.review, { star });
        this.setReview(rv);
      },
    },
    comment: {
      get: function() {
        return this.review.comment || '';
      },
      set: function(comment) {
        let rv = Object.assign(this.review, { comment });
        this.setReview(rv);
      },
    },
    notReady: function() {
      return this.rvstat === dataStatus.INTIAL || this.rvstat === dataStatus.BUZY;
    },
    accessible: function() {
      return this.rvstat === dataStatus.ACCESSIBLE;
    },
    ...mapGetters({
      review: 'getReview',
      rvstat: 'getReviewStatus',
    }),
  },
  methods: {
    register: function() {
      if (this.$refs.form.validate()) {
        this.$emit('onRegister', { comment: this.comment, star: this.star });
      }
    },
    cancel: function() {
      this.setDialog(false);
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
.progress {
  position: fixed;
  top: 100px;
  left: 50%;
  text-align: center;
}
</style>
