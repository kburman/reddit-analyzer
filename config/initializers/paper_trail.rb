PaperTrail.config.enabled = true
PaperTrail.config.has_paper_trail_defaults = {
  on: %i[update],
  skip: [:updated_at]
}
PaperTrail.config.version_limit = 10
