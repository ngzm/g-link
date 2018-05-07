<template>
  <v-dialog
    v-model="displayme"
    width="600"
  >
    <v-card class="pb-2">
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <v-card-title>
          <div>
            <h3 class="headline">評価・口コミ登録</h3>
            <p class="mt-3">{{ title }} は気に入りましたか？</p>
          </div>
        </v-card-title>
        <v-divider/>
        <v-card-text>
          <div>
            <h3 class="title">評価</h3>
            <star-rating
              v-model="star"
              class="mt-3"
            />
          </div>
          <div class="mt-4">
            <h3 class="title mt-1">口コミ</h3>
            <v-text-field
              v-model="comment"
              :counter="commentSize"
              :rules="commentRules"
              label="口コミ"
              required
              textarea
            />
          </div>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <div>
            <v-btn
              :disabled="!valid"
              dark
              color="blue"
              @click.native="register"
            >
              登録する
            </v-btn>
            <v-btn
              color="grey"
              dark
              @click.native="setDialog(false)"
            >
              やめる
            </v-btn>
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
  components: {
    StarRating
  },
  props: {
    title: {
      default: '',
      type: String,
    },
    dialog: {
      required: true,
      type: Boolean,
    },
    setDialog: {
      required: true,
      type: Function,
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
};
</script>

<style>
</style>
