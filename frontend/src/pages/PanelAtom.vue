<template lang="pug">
.panel-atom
  admin-navigator
  el-button.create(type="primary",
                   @click="$router.push('/admin/editor')")
    | {{ $t('createArticle') }}
  .atom-list
    .atom(v-for="atom in atoms.data")
      atom-card(:id="atom.atom_id",
                :title="atom.title",
                :abstract="atom.abstract",
                :thumbnail="atom.image",
                :language="atom.language",
                :author="atom.author",
                :date="atom.created_time",
                @delete="deleteCard(atom.atom_id)")
    el-pagination(:current-page.sync="atoms.currentPage",
                :page-size="1",
                layout="prev, pager, next, jumper",
                :total="atoms.totalPage",
                @current-change="fetchData")
</template>

<script>
import { mapState, mapActions } from 'vuex';
import AdminNavigator from '@/components/AdminNavigator';
import AtomCard from '@/components/AtomCard';

export default {
  name: 'PanelAtom',
  components: {
    AdminNavigator,
    AtomCard,
  },
  computed: mapState([
    'user',
    'atoms',
  ]),
  methods: {
    fetchData() {
      this.getAtomList({
        token: this.user.token,
        page: this.atoms.currentPage,
      });
    },
    deleteCard(id) {
      this.$confirm(this.$t('permanentDelete'), this.$t('confirm'), {
        confirmButtonText: this.$t('confirm'),
        cancelButtonText: this.$t('cancel'),
        type: 'warning',
      }).then(() => {
        this.deleteAtom({
          token: this.user.token,
          id,
        });
      });
    },
    ...mapActions([
      'getAtomList',
      'deleteAtom',
    ]),
  },
  watch: {
    $route: 'fetchData',
  },
  created() {
    this.fetchData();
  },
};
</script>

<style lang="stylus" scoped>
.atom-list
  width: 60%
  padding 40px
.create
  margin 40px 0 0 40px
</style>
